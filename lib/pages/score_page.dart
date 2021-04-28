import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/turn_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/btn_perfil_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'package:roolly/widgets/icon_button_widget.dart';

import 'acting_page.dart';
import 'home_page.dart';

class Score extends StatefulWidget {
  final String? code;
  final String? tema;
  final int? limite;
  final List? players;
  final List? newOrder;
  final String? userId;
  final int? turnNo;
  final int? personajeAleatorio;

  const Score(
      {Key? key,
      this.code,
      this.tema,
      this.limite,
      this.players,
      this.newOrder,
      this.userId,
      this.turnNo,
      this.personajeAleatorio})
      : super(key: key);
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Score> {
  int? _time = 20;

  void secsTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time! > 0) {
        setState(() {
          _time = _time! - 1;
        });
      } else {
        if (widget.newOrder!.length - 1 == widget.turnNo) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      partidaTerminada: true,
                    )),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Turn(
                      tema: widget.tema,
                      numeroAleatorio: widget.personajeAleatorio,
                      code: widget.code,
                      limite: widget.limite,
                      newOrder: widget.newOrder,
                      players: widget.players,
                      turnNo: widget.turnNo! + 1,
                      userId: widget.userId,
                    )),
          );
        }
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
              height: responsive.hp(7),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("El proximo turno empieza en ${_time} ",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text("Termino la actuación de: ",
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
                    height: responsive.hp(4),
                  ),
                  Icon(
                    FontAwesomeIcons.trophy,
                    color: EasyColors.myyellow,
                    size: responsive.dp(8),
                  ),
                  SizedBox(
                    height: responsive.hp(8),
                  ),
                  Text("Selecionando al siguiente participante...",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(15),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
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
