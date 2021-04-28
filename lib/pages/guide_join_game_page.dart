import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/guide_create_game_page.dart';
import 'package:roolly/pages/guide_howplay_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'guide_starting_page.dart';

class GuideJoinGame extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<GuideJoinGame> {
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
                  Text("Unirse a una Partida",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Para unirte a una partida, dirigete a la pantalla de inicio y da clic en el botón "unirse a una partida"',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img6.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Posteriormente solicita el código a la persona que creo una partida previamente y anótalo.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img7.png",
                    width: responsive.wp(60),
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text(
                      'Asegúrate de escribirlo completo y sin errores. cuando estés listo da clic en "aceptar".',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img8.png",
                    width: responsive.wp(40),
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
                                builder: (context) => GuideCreateGame()),
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
                                builder: (context) => GuideHowPlay()),
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
