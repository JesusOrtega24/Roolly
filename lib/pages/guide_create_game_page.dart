import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/guide_join_game_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'guide_starting_page.dart';

class GuideCreateGame extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<GuideCreateGame> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
        child: Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(children: [
            NavbarMenuWidget(
              hovered1: "inactive",
              type: "help",
            ),
            SizedBox(
              height: responsive.hp(7),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Crear Partida",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'El primer paso para comenzar es crear una partida. Para ello, uno de los integrantes deberá dar clic en el botón "crear partida"',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img1.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Posteriormente, elige el numero de integrantes en la partida *Nota: como mínimo dos personas.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img2.png",
                    width: responsive.wp(60),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Elige un tema de lo mas de 20 disponibles sobre el cual quieran actuar, pero no olvides tomar en cuenta la opinion de los demás.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img3.png",
                    width: responsive.wp(60),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Al crear partida, se generará un código e 6 caracteres, Pásalo a los demás integrantes que quieras invitar a la partida.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img4.png",
                    width: responsive.wp(60),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Espera unos segundos a que los demás participantes introduzcan el código y les una a la partida, cuando estén listos da clic en "comenzar"',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img5.png",
                    width: responsive.wp(45),
                  ),
                  SizedBox(
                    height: responsive.hp(10),
                  ),
                  Row(children: [
                    Flexible(
                      child: RoollyButton(
                        text: "Anterior",
                        type: "secondary",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuideStarting()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: responsive.wp(4),
                    ),
                    Flexible(
                      child: RoollyButton(
                        text: "Siguiente",
                        type: "secondary",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuideJoinGame()),
                          );
                        },
                      ),
                    ),
                  ]),
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
