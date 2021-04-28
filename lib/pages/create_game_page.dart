import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'join_game_page.dart';
import 'waiting_players_page.dart';

class CreateGame extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<CreateGame> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? dropdownValue = "2";
  String? dropdownValue2 = "Peliculas";
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
              height: responsive.hp(15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Límite de participantes",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Container(
                    height: responsive.hp(6),
                    width: responsive.wp(100),
                    decoration: BoxDecoration(
                        color: EasyColors.mylightgray,
                        border: Border.all(
                          color: EasyColors.mylightgray,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        value: dropdownValue,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: EasyColors.mycolorfonts),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>["2", "3", "4", "5", "6", "7", "8"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: responsive.hp(3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Tema",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Container(
                    height: responsive.hp(6),
                    width: responsive.wp(100),
                    decoration: BoxDecoration(
                        color: EasyColors.mylightgray,
                        border: Border.all(
                          color: EasyColors.mylightgray,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        value: dropdownValue2,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: EasyColors.mycolorfonts),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>[
                          "Peliculas",
                          "Personajes Historicos",
                          "Deportes",
                          "Caricaturas",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsive.hp(20),
                  ),
                  RoollyButton(
                    text: "Aceptar",
                    onPressed: () {
                      String? codigoPartida = getRandomString(4);
                      int? numeroParticipantes = int.parse(dropdownValue!);
                      String? tema = dropdownValue2;
                      _firestore.collection('partidas').doc(codigoPartida).set({
                        "empezo": false,
                        "codigo_partida": codigoPartida,
                        "numero_participantes": numeroParticipantes,
                        "tema": tema,
                        "usuarios_conectados": [_firebaseAuth.currentUser!.uid],
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaitingPlayers(
                                  codigo: codigoPartida,
                                  tema: tema,
                                  limite: numeroParticipantes,
                                  isCreator: true,
                                )),
                      );
                    },
                    type: "secondary",
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
