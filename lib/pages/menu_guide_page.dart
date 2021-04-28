import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/pages/guide_create_game_page.dart';
import 'package:roolly/pages/guide_howplay_page.dart';
import 'package:roolly/pages/guide_join_game_page.dart';
import 'package:roolly/pages/guide_rules_page.dart';
import 'package:roolly/pages/rating_page.dart';
import 'package:roolly/pages/report_problem_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_menu_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'fqa_page.dart';
import 'guide_starting_page.dart';
import 'terms_page.dart';

class MenuGuide extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<MenuGuide> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
        child: Scaffold(
      body: Form(
        child: Column(children: [
          NavbarMenuWidget(),
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
                  text: "Empezando",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuideStarting()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Crear Partida",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GuideCreateGame()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Unirse a una Partida",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuideJoinGame()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                ),
                RoollyButtonMenu(
                  text: "Cómo Jugar",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuideHowPlay()),
                    );
                  },
                ),
                SizedBox(
                  height: responsive.hp(4),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
