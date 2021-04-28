import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/widgets/btn_perfil_widget.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'score_page.dart';

class Acting extends StatefulWidget {
  final String? tema;
  final int? personajeAleatorio;
  final List? newOrder;
  final String? code;
  final int? limite;
  final List? players;
  final String? userId;
  final int? turnNo;
  final int? time;

  const Acting({
    Key? key,
    this.tema,
    this.personajeAleatorio,
    this.newOrder,
    this.code,
    this.limite,
    this.players,
    this.userId,
    this.turnNo,
    this.time,
  }) : super(key: key);

  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Acting> {
  String? _userPlayingId;
  int? _time;

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
              builder: (context) => Score(
                    tema: widget.tema,
                    personajeAleatorio: widget.personajeAleatorio,
                    code: widget.code,
                    limite: widget.limite,
                    newOrder: widget.newOrder,
                    players: widget.players,
                    turnNo: widget.turnNo,
                    userId: widget.userId,
                  )),
        );
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _time = widget.time;
      _userPlayingId = widget.newOrder![widget.turnNo!];
    });
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
            height: responsive.hp(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(2),
                ),
                Text("Esta Actuando...",
                    style: TextStyle(
                        fontFamily: 'Arciform',
                        fontSize: responsive.dp(3),
                        color: EasyColors.myorange)),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyContainerProfile(
                  id: _userPlayingId,
                  type: "btnyellow",
                ),
                SizedBox(
                  height: responsive.hp(40),
                ),
                Visibility(
                  visible: (_userPlayingId == widget.userId!),
                  child: Column(
                    children: [
                      RoollyButton(
                        text: "${_time} Segundos restantes",
                        type: "btnorange",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Score()),
                          );
                        },
                      ),
                      SizedBox(
                        height: responsive.hp(4),
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
