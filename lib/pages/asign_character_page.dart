import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_perfil_widget.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'acting_page.dart';

class AsignCharacter extends StatefulWidget {
  final String? tema;
  final int? numeroAleatorio;
  final List? newOrder;
  final String? code;
  final int? limite;
  final List? players;
  final String? userId;
  final int? turnNo;

  const AsignCharacter(
      {Key? key,
      this.tema,
      this.numeroAleatorio,
      this.newOrder,
      this.code,
      this.limite,
      this.players,
      this.userId,
      this.turnNo})
      : super(key: key);
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<AsignCharacter> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _characterName = '...';
  String? _imageUrl = '...';
  String? _acting = '...';
  String? _phrase = '...';
  int? _time = 15;

  void getCharacterData() async {
    await _firestore
        .collection('personajes')
        .doc(widget.tema)
        .get()
        .then((snapshot) {
      setState(() {
        _characterName = snapshot[widget.numeroAleatorio.toString()]['nombre'];
        _imageUrl = snapshot[widget.numeroAleatorio.toString()]['imagen'];
        _acting = snapshot[widget.numeroAleatorio.toString()]['actuaciones'][0]
            ['descripcion'];
        _phrase = snapshot[widget.numeroAleatorio.toString()]['dialogos'][0]
            ['descripcion'];
      });
    });
  }

  void secsTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time! > 0) {
        setState(() {
          _time = _time! - 1;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Acting(
                    tema: widget.tema,
                    personajeAleatorio: widget.numeroAleatorio,
                    code: widget.code,
                    limite: widget.limite,
                    newOrder: widget.newOrder,
                    players: widget.players,
                    turnNo: widget.turnNo,
                    userId: widget.userId,
                    time: 20,
                  )),
        );
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacterData();
    secsTimer();
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
            height: responsive.hp(5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(2),
                ),
                RoollyButton(
                  text: _characterName!,
                  type: "btnblue",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Acting()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(5),
                ),
                Text("Tienes ${_time} Segundos para Prepararte",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Image.network(_imageUrl!,
                    width: responsive.wp(30), height: responsive.hp(20)),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Text(_acting!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(4),
                ),
                Text(_phrase!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(2),
                ),
                SizedBox(
                  height: responsive.hp(4),
                )
              ],
            ),
          )
        ]),
      )),
    ));
  }
}
