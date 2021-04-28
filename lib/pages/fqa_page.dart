import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'menu_help_page.dart';

class Fqa extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Fqa> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
        child: Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(children: [
            NavbarMenuWidget(
              hovered1: "active",
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
                  Text("Preguntas Frecuentes",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text("¿En qué dispositivos se podrá utilizar la aplicación?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                      '¿Necesito tener conexión a internet para que la app funcione?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text('¿Qué acciones puedo hacer en la aplicación?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                      '¿Necesito tener un nivel de conocimiento tencológico experto?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text('¿Necesito crear el perfil con mis datos reales?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                      '¿Qué pasa cuando sale una nueva versión o actualización?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                      '¿Debo pagar por las funciones o actualizaciones de la app?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text('¿Cómo puedo reportar un problema?        ',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                      '¿Cómo puedo constribuir para el mejoramiento de la app?',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  RoollyButton(
                    text: "Regresar",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuHelp()),
                      );
                    },
                    type: "secondary",
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
