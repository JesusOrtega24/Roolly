import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
              type: "user",
            ),
            SizedBox(
              height: responsive.hp(7),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/img_user.png',
                      width: responsive.wp(45),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  Text("Nombre del usuario",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  RoollyButton(
                    text: "Editar Perfil",
                    type: "btnyellow",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: responsive.hp(4),
                  ),
                  Text('Estadísticas generales',
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  Text('Actuación Física',
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: responsive.hp(7),
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
