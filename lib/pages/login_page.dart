import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/home_page.dart';
import 'package:roolly/pages/register_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    double padding = responsive.wp(8);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Container(
                      color: EasyColors.myorange,
                      width: responsive.wp(100),
                      height: responsive.hp(35),
                    ),
                    Positioned(
                      left: responsive.wp(35),
                      top: responsive.hp(2),
                      child: Image.asset(
                        "assets/images/logo1.png",
                        width: responsive.wp(30),
                        height: responsive.hp(30),
                      ),
                    )
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      children: [
                        SizedBox(
                          height: responsive.hp(4),
                        ),
                        Text("Iniciar Sesión",
                            style: TextStyle(
                                fontFamily: 'Arciform',
                                fontSize: responsive.dp(4),
                                color: EasyColors.myorange)),
                        SizedBox(
                          height: responsive.hp(
                            5,
                          ),
                        ),
                        RoollyInput(
                          type: 'email',
                          controlador: _emailController,
                          labelText: 'Correo Electrónico',
                          placeholder: 'Introduce tu correo electrónico',
                        ),
                        SizedBox(
                          height: responsive.hp(3),
                        ),
                        RoollyInput(
                          type: 'password',
                          controlador: _passwordController,
                          labelText: 'Contraseña',
                          placeholder: 'Introduce tu contraseña',
                        ),
                        SizedBox(
                          height: responsive.hp(2),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RoollyButton(
                          text: "Iniciar Sesión",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await _firebaseAuth
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text)
                                    .then((value) => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        ));
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text("Error en los datos"),
                                          content: Text(e.toString()),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('Cerrar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ));
                              }
                            }
                          },
                          type: "secondary",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 3,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿No tienes cuenta?',
                              style: TextStyle(
                                  fontFamily: 'Arciform',
                                  fontSize: responsive.wp(5.5),
                                  color: EasyColors.mycolorfonts),
                            ),
                            SizedBox(
                              width: responsive.wp(4),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                'Registrate',
                                style: TextStyle(
                                    fontFamily: 'Arciform',
                                    fontSize: responsive.wp(5.5),
                                    color: EasyColors.myorange),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: responsive.hp(7),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
