import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/guide_join_game_page.dart';
import 'package:roolly/pages/menu_guide_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

class GuideHowPlay extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<GuideHowPlay> {
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
                  Text("Cómo jugar",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Cuando se encuentren todos los participantes en la partida da clic en comenzar. A continuación, la aplicación seleccionará a uno de los participantes. ',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img9.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Después de seleccionar a un integrante, se le asignara un rol del tema seleccionado, el cual deberá interpretar. Para ello se le dará un limite de tiempo para recordar los diálogos, movimientos o acciones que deberá realizar',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img10.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Al acabarse el tiempo de preparación, la aplicación mostrará un nuevo cronometro correspondiente al tiempo limite de actuación y al usuario que este actuando en ese momento.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img11.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Al terminarse el tiempo de actuación, los demás participantes calificaran la actuación de dos formas:',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      '- Física: comprende los movimientos, acciones, gestos, mímicas entre otros.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      '- Verbal: comprende los diálogos, memorias, imaginación al actuar entre otros.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Image.asset(
                    "assets/images/img12.png",
                    width: responsive.wp(40),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Al terminar de calificar todos los participantes, e seleccionará nuevamente otro integrante y se le asignará un personaje diferente. Al terminar de pasar todos los integrantes, se mostrará una tabla de puntuación general de cada jugador.',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
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
                                builder: (context) => GuideJoinGame()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: responsive.wp(4),
                    ),
                    Flexible(
                      child: RoollyButton(
                        text: "Inicio",
                        type: "secondary",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuGuide()),
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
