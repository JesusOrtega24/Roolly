import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_perfil_widget.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'turn_page.dart';

class WaitingPlayers extends StatefulWidget {
  final String? codigo;
  final String? tema;
  final int? limite;
  final bool? isCreator;

  WaitingPlayers({this.codigo, this.tema, this.limite, this.isCreator = false});

  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<WaitingPlayers> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List? players;
  List? newOrder = ['...'];
  Random random = Random();
  int? numeroAleatorio;

  Future<void> setOrdenJuego() async {
    List? order = players!..shuffle();
    await _firestore.collection('partidas').doc(widget.codigo).update({
      'orden_juego': order,
    });
    setState(() {
      newOrder = order;
    });
  }

  int? getNumeroAleatorio() {
    return random.nextInt(3);
  }

  void createJugadoresCollectionDocuments() async {
    List? numeros = [];
    var list = List.generate(4, (index) => index)..shuffle();
    print('GAB');
    print(list);
    for (int i = 0; i < players!.length; i++) {
      await _firestore
          .collection('partidas')
          .doc(widget.codigo)
          .collection('jugadores')
          .doc(newOrder![i])
          .set({
        "personaje": list[i],
      });
    }
  }

  Future<String?> getUsername(String userId) async {
    String? username = "";
    await _firestore.collection('usuarios').doc(userId).get().then((snapshot) {
      username = snapshot['username'];
    });
    return username;
  }

  void listenSnapshot() async {
    var stream;
    cancelStream() {
      stream.cancel();
    }

    stream = _firestore
        .collection('partidas')
        .doc(widget.codigo)
        .snapshots()
        .listen((event) async {
      if (event['empezo'] != null) {
        if (event['empezo'] == true) {
          Timer(Duration(seconds: 1), () async {
            await _firestore
                .collection('partidas')
                .doc(widget.codigo)
                .collection('jugadores')
                .doc(_firebaseAuth.currentUser!.uid)
                .get()
                .then((snapshot) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Turn(
                          code: widget.codigo,
                          tema: widget.tema,
                          players: event['usuarios_conectados'],
                          newOrder: event['orden_juego'],
                          limite: widget.limite,
                          userId: _firebaseAuth.currentUser!.uid,
                          turnNo: 0,
                          numeroAleatorio: snapshot['personaje'],
                        )),
              );
            });
            cancelStream();
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listenSnapshot();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
        child: Scaffold(
      body: Form(
          child: SingleChildScrollView(
        child: Column(children: [
          NavbarMenuWidget(),
          SizedBox(
            height: responsive.hp(4),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoollyButton(
                  text: "Partida: ${widget.codigo}",
                  type: "btnyellow",
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                RoollyButton(
                  text: "${widget.tema}",
                  type: "btnyellow",
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Text("Jugadores Conectados",
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(2),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('partidas')
                      .where("codigo_partida", isEqualTo: widget.codigo)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Text('Cargando...');
                    return Column(
                      children: snapshot.data!.docs
                          .map<Widget>((DocumentSnapshot document) {
                        var usuarios = document['usuarios_conectados'];
                        players = usuarios;
                        return Column(
                            children: usuarios.map<Widget>((index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: responsive.hp(1)),
                            child: RoollyContainerProfile(
                                id: index, type: "yellow"),
                          );
                        }).toList());
                      }).toList(),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Visibility(
                  visible: widget.isCreator!,
                  child: Column(
                    children: [
                      RoollyButton(
                        text: "Continuar",
                        onPressed: () async {
                          await _firestore
                              .collection('partidas')
                              .doc(widget.codigo)
                              .get()
                              .then((DocumentSnapshot document) async {
                            final int? numeroPartipantes =
                                document['usuarios_conectados'].length;
                            print(numeroPartipantes);
                            if (numeroPartipantes == widget.limite) {
                              setOrdenJuego().then((value) async {
                                createJugadoresCollectionDocuments();
                                await _firestore
                                    .collection('partidas')
                                    .doc(widget.codigo)
                                    .update({
                                  'empezo': true,
                                });
                              });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text(
                                            "Falta que se unan mas jugadores"),
                                        content: Text(
                                            "Limite de jugadores no alcanzado: ${widget.limite} "),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cerrar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ));
                            }
                          });
                        },
                        type: "secondary",
                      ),
                      SizedBox(
                        height: responsive.hp(3),
                      ),
                      RoollyButton(
                        text: "Eliminar partida",
                        onPressed: () async {
                          await _firestore
                              .collection('partidas')
                              .doc(widget.codigo)
                              .delete()
                              .then((value) => Navigator.pop(context));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      )),
    ));
  }
}
