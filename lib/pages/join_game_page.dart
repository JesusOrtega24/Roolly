import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/pages/waiting_players_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/input_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

class JoinGame extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<JoinGame> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            NavbarMenuWidget(),
            SizedBox(
              height: responsive.hp(25),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Código de la partida",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  RoollyInput(
                    controlador: _controller,
                    placeholder: 'CODIGO',
                    type: 'join',
                  ),
                  SizedBox(
                    height: responsive.hp(30),
                  ),
                  RoollyButton(
                    text: "Aceptar",
                    onPressed: () {
                      String codigoPartida = _controller.value.text;
                      if (_formKey.currentState!.validate()) {
                        try {
                          List? users;
                          int? limite;
                          String? tema;
                          _firestore
                              .collection('partidas')
                              .doc(codigoPartida)
                              .get()
                              .then((DocumentSnapshot document) async {
                            limite = document['numero_participantes'];
                            tema = document['tema'];
                            users = document['usuarios_conectados'];
                            users!.add(_firebaseAuth.currentUser!.uid);
                            if (users!.length <= limite!) {
                              await _firestore
                                  .collection('partidas')
                                  .doc(codigoPartida)
                                  .update({
                                "usuarios_conectados": users,
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WaitingPlayers(
                                      codigo: codigoPartida,
                                      tema: tema,
                                      limite: limite),
                                ),
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "Limite de jugadores alcanzado"),
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
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    type: "secondary",
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
