import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/pages/home_page.dart';
import 'package:roolly/pages/menu_help_page.dart';
import 'package:roolly/pages/profile_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_button_widget.dart';

class NavbarMenuWidget extends StatelessWidget {
  final String? hovered1;
  final String? type;
  const NavbarMenuWidget({Key? key, this.hovered1, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Container(
      color: EasyColors.myorange,
      height: responsive.hp(10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: Image.asset('assets/images/logo4.png',
                width: responsive.wp(30), height: responsive.hp(10)),
          ),
          Expanded(child: SizedBox()),
          RoollyIconButton(
            hovered: (hovered1 == "active" && type == "home")
                ? this.hovered1
                : "inactive",
            iconButton: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: (hovered1 == "active" && type == "home")
                    ? Colors.white
                    : EasyColors.myyellow,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          SizedBox(width: responsive.wp(2)),
          RoollyIconButton(
            hovered: (hovered1 == "active" && type == "user")
                ? this.hovered1
                : "inactive",
            iconButton: IconButton(
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  color: (hovered1 == "active" && type == "user")
                      ? Colors.white
                      : EasyColors.myyellow,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }),
          ),
          SizedBox(width: responsive.wp(2)),
          RoollyIconButton(
            hovered: (hovered1 == "active" && type == "help")
                ? this.hovered1
                : "inactive",
            iconButton: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.question,
                color: (hovered1 == "active" && type == "help")
                    ? Colors.white
                    : EasyColors.myyellow,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuHelp()),
                );
              },
            ),
          ),
          SizedBox(width: responsive.wp(5))
        ],
      ),
    );
  }
}
