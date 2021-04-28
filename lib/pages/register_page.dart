import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/dropdown_widget.dart';
import 'package:roolly/widgets/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool? checked = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String? _genre = "Masculino";
  final _formKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectGenre(String? value) {
    _genre = value;
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    double padding = responsive.wp(8);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: responsive.hp(7),
                  ),
                  Text("Registrate",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3.5),
                          color: EasyColors.myorange)),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  Row(children: [
                    Flexible(
                      child: RoollyInput(
                        controlador: _nameController,
                        labelText: 'Nombre',
                        placeholder: 'Ingresa aqui tu nombre',
                      ),
                    ),
                    SizedBox(
                      width: responsive.wp(4),
                    ),
                    Flexible(
                      child: RoollyInput(
                        controlador: _apellidoController,
                        labelText: 'Apellido(s)',
                        placeholder: 'Ingresa aqui tu apellido(S)',
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  RoollyInput(
                      type: 'username',
                      controlador: _userNameController,
                      labelText: "Nombre de usuario",
                      placeholder: "Escribe aqui tu nombre de usuario"),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text("Fecha de nacimiento",
                      style: TextStyle(
                          fontFamily: 'Arciform',
                          fontSize: responsive.dp(3),
                          color: EasyColors.mycolorfonts)),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Container(
                    height: responsive.hp(6),
                    decoration: BoxDecoration(
                        color: EasyColors.mylightgray,
                        border: Border.all(
                          color: EasyColors.mylightgray,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(4),
                        ),
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: responsive.dp(2),
                              color: EasyColors.mycolorfonts),
                        ),
                        SizedBox(
                          width: responsive.wp(40),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                              width: responsive.wp(15),
                              child: Icon(Icons.arrow_drop_down)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RoollyDropdown(
                    labelText: "Género",
                    action: _selectGenre,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RoollyInput(
                    type: 'email',
                    controlador: _emailController,
                    labelText: "Correo Electronico",
                    placeholder: "Escribe aqui tu correo",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RoollyInput(
                    type: 'password',
                    controlador: _passwordController,
                    labelText: "Contraseña",
                    placeholder: "Escribe aqui tu contraseña",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checked,
                        onChanged: (value) {
                          setState(() {
                            checked = value;
                          });
                        },
                      ),
                      Text(
                        'Acepto los terminos y condiciones',
                        style: TextStyle(
                            fontFamily: 'Arciform',
                            fontSize: responsive.dp(2.2),
                            color: EasyColors.mycolorfonts),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoollyButton(
                    text: "Registrarme",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String? email = _emailController.value.text.trim();
                        String? password = _passwordController.value.text;
                        try {
                          await _firebaseAuth
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((value) {
                            String? nombre = _nameController.value.text;
                            String? apellidos = _apellidoController.value.text;
                            String? username = _userNameController.value.text;
                            DateTime? fecha = selectedDate;
                            String? genero = _genre;

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                            _firestore
                                .collection('usuarios')
                                .doc(value.user!.uid)
                                .set({
                              "uid": value.user!.uid,
                              "nombre": nombre,
                              "apellidos": apellidos,
                              "username": username,
                              "fechanacimiento": fecha,
                              "genero": genero,
                            });
                          });
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
                        '¿Ya tienes cuenta?',
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
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                fontFamily: 'Arciform',
                                fontSize: responsive.wp(5.5),
                                color: EasyColors.myorange),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: responsive.hp(7),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
