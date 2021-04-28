import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'menu_help_page.dart';

class Rating extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<Rating> {
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
                  Text("Valoraciones y Reseñas",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Image.asset("assets/images/logo2.png",
                      width: responsive.wp(30), height: responsive.hp(20)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text("Valora nuestra App",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: responsive.wp(8)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: EasyColors.mylightgray,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.star,
                                size: responsive.dp(3),
                                color: EasyColors.myorange,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: EasyColors.mylightgray,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.star,
                                size: responsive.dp(3),
                                color: EasyColors.myorange,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: EasyColors.mylightgray,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.star,
                                size: responsive.dp(3),
                                color: EasyColors.myorange,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: EasyColors.mylightgray,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.star,
                                size: responsive.dp(3),
                                color: EasyColors.myorange,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: EasyColors.mylightgray,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.star,
                                size: responsive.dp(3),
                                color: EasyColors.myorange,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text('Escribir Sugerencia',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Container(
                    child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(20.0),
                            fillColor: EasyColors.mylightgray,
                            filled: true,
                            hintText: "Escribe aqui tu sugerencia",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))))),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: responsive.wp(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoollyButton(
                          text: "Enviar",
                          type: "btnblue",
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => MenuHelp()),
                            // );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: responsive.hp(7),
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
