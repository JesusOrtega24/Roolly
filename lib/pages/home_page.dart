import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create_game_page.dart';
import 'initial_page.dart';
import 'join_game_page.dart';
import 'menu_guide_page.dart';

class HomePage extends StatefulWidget {
  final bool? partidaTerminada;

  const HomePage({Key? key, this.partidaTerminada = false}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      if (widget.partidaTerminada!) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Partida terminada"),
                  content: Text("Gracias por jugar"),
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
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        NavbarMenuWidget(
          hovered1: "active",
          type: "home",
        ),
        SizedBox(
          height: responsive.hp(20),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
          child: Column(
            children: [
              RoollyButton(
                text: "Crear partida",
                type: "btnblue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateGame()),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: responsive.hp(4),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
          child: Column(
            children: [
              RoollyButton(
                text: "Unirse a una partida",
                type: "btnblue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JoinGame()),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: responsive.hp(4),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
          child: Column(
            children: [
              RoollyButton(
                text: "Guía de juego",
                type: "btnyellow",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuGuide()),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: responsive.hp(4),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
          child: Column(
            children: [
              RoollyButton(
                text: "Salir",
                type: "btnmain",
                onPressed: () {
                  _firebaseAuth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InitialPage()));
                },
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
