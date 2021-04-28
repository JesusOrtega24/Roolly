import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/pages/about_us_page.dart';
import 'package:roolly/pages/rating_page.dart';
import 'package:roolly/pages/report_problem_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_menu_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

import 'about_app_page.dart';
import 'fqa_page.dart';
import 'terms_page.dart';

class MenuHelp extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<MenuHelp> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
        child: Scaffold(
      body: Form(
        child: Column(children: [
          NavbarMenuWidget(
            hovered1: "active",
            type: "help",
          ),
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
                RoollyButtonMenu(
                  text: "Acerca de la app",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutApp()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Preguntas Frecuentes",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fqa()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Términos y Condiciones",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Terms()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Valoraciones y Reseñas",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rating()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Reportar un Problema",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportProblem()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Desarrolladores",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
