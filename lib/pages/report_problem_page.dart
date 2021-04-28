import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'menu_help_page.dart';

class ReportProblem extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<ReportProblem> {
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
                  Text("Reportar un Problema",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text(
                    'En este apartado podrá reportar un problema relacionado con el funcionamiento de la app, por favor escriba en el siguiente apartado su queja y trabajaremos en solucionar el problema lo mas pronto posible',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: responsive.dp(2.2),
                        color: EasyColors.mycolorfonts),
                  ),
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
                            hintText: "Escribe aquí tu problema",
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
                    height: responsive.hp(2),
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
                          ])),
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
