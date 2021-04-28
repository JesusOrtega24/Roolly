import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'menu_help_page.dart';

class Terms extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Terms> {
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
                  Text("Términos y Condiciones",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      "Estos Términos del Servicio reflejan la forma de trabajar de Roolly como empresa, las leyes por las que nos regimos y determinados aspectos que siempre hemos creído que son ciertos. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Roolly contigo cuando interactúas con nuestros servicios. ",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text("Privacidad",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      "Cuando se registra y utiliza nuestros servicios, nosotros recopilamos la información que usted nos brinda. Esto puede incluir información como su nombre, dirección de correo electrónico, fecha de nacimiento y contraseñas.",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      "Nosotros utilizamos la información proporcionada por usted y la información que recopilamos con el fin de brindar, mantener y mejorar nuestros servicios, ya sea para efectuar la resolución de problemas, el análisis de datos, realizar pruebas, investigaciones, análisis estadísticos y mediciones, entre otros propósitos. ",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text("Términos y Condiciones",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      "Nosotros no vendemos ni venderemos su información personal a terceras partes. Sin embargo, permitimos que proveedores de servicio externos recopilen información personal, como se describe en este enlace, a través de algunos de nuestros servicios y nosotros compartimos información personal con proveedores de servicio externos con propósitos comerciales como se describe en esta política, que incluyen, pero no se limitan a proveer publicidad en nuestros servicios o en otro lugar basado en las actividades en la red de los usuarios a lo largo del tiempo y a través de diferentes sitios, servicios o dispositivos.",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
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
