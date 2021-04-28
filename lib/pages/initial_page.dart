import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/login_page.dart';
import 'package:roolly/pages/register_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: EasyColors.myorange,
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/logo1.png",
                  width: responsive.wp(55), height: responsive.hp(65)),
              RoollyButton(
                text: "Registrar",
                type: "mainbtn",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
              SizedBox(
                height: responsive.hp(3),
              ),
              RoollyButton(
                text: "Iniciar Sesión",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                type: "mainbtn",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
