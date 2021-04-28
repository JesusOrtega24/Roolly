import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/guide_create_game_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'menu_guide_page.dart';

class GuideStarting extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<GuideStarting> {
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
                  Text("Empezando",
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
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  SizedBox(
                    height: responsive.hp(35),
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
                                builder: (context) => MenuGuide()),
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
                                builder: (context) => GuideCreateGame()),
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
