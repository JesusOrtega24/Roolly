import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/guide_howplay_page.dart';
import 'package:roolly/pages/menu_guide_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

class GuideRules extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<GuideRules> {
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
                  Text("Reglas de juego",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                      '1.- Respeto por las actuaciones de los demás participantes',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(2.2),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(4),
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
                                builder: (context) => GuideHowPlay()),
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
