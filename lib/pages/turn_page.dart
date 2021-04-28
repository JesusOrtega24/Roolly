import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_perfil_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'acting_page.dart';
import 'asign_character_page.dart';

class Turn extends StatefulWidget {
  final String? code;
  final String? tema;
  final int? limite;
  final List? players;
  final List? newOrder;
  final String? userId;
  final int? turnNo;
  final int? numeroAleatorio;

  const Turn({
    Key? key,
    this.code,
    this.tema,
    this.limite,
    this.players,
    this.newOrder,
    this.userId,
    this.turnNo,
    this.numeroAleatorio,
  }) : super(key: key);
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Turn> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      if (widget.userId == widget.newOrder![widget.turnNo!]) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AsignCharacter(
                    tema: widget.tema,
                    numeroAleatorio: widget.numeroAleatorio,
                    code: widget.code,
                    limite: widget.limite,
                    newOrder: widget.newOrder,
                    players: widget.players,
                    turnNo: widget.turnNo,
                    userId: widget.userId,
                  )),
        );
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
                    time: 35,
                  )),
        );
      }
    });
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
            height: responsive.hp(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(1),
                ),
                Text("Es el Turno de...",
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyContainerProfile(
                  id: widget.newOrder![widget.turnNo!],
                  type: "btnyellow",
                ),
                SizedBox(
                  height: responsive.hp(10),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          )
        ]),
      )),
    ));
  }
}
