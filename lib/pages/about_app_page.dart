import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'menu_help_page.dart';

class AboutApp extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<AboutApp> {
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
                  Text("Acerca de la app",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      "Roolly es una aplicación web de actuaciones dinámicas o roleplay entre usuarios enfocada al uso de cualquier grupo de personas, especialmente para adultos mayores, con la finalidad de mejorar las destrezas físicas y mentales y sobre todo pasar un buen rato de diversión.",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Roolly es una palabra derivada del sonido fonético de las palabras "roll-it", haciendo alusión al roleo entre amigos. Las mascaras representan las actuaciones teatrales, donde cada personaje interpreta un rol o papel. las emociones que representan se refieren a las que principalmente se espera que el usuario obtenga del uso de la app.',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'El principal objetivo de Roolly no es mas que el de entretener, así como de conocer nuevos personajes ya sea ficticios o reales que forman parte de la cultura y la historia, ayudando al mismo tiempo a las usuarios a mejorar sus destrezas mentales al recordar diálogos o usar la imaginación para interpretar cada rol y las destrezas físicas realizadas al actuar.',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      'Esperamos que disfrutes de la app y envies sugerencias para que sigamos mejorándola',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  Image.asset("assets/images/logo2.png",
                      width: responsive.wp(40), height: responsive.hp(30)),
                  Text("Versión 1.1.0 Beta",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3.5),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
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
