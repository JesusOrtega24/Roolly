import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/pages/profile_page.dart';
import 'package:roolly/utils/responsive.dart';
import 'package:roolly/widgets/btn_widget.dart';
import 'package:roolly/widgets/dropdown_widget.dart';
import 'package:roolly/widgets/input_widget.dart';
import 'package:roolly/widgets/nabvar_menu_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<EditProfilePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _userId = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //change
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String? _genre = "Masculino";
  DateTime _selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  _selectGenre(String? value) {
    _genre = value;
  }

  void getUserValues() async {
    _userId = _firebaseAuth.currentUser!.uid;
    await _firestore
        .collection('usuarios')
        .doc(_userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        _nameController.text = documentSnapshot['nombre'];
        _apellidoController.text = documentSnapshot['apellidos'];
        _userNameController.text = documentSnapshot['username'];
        _genre = documentSnapshot['genero'];
        _selectedDate = documentSnapshot['fechanacimiento'].toDate();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserValues();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            NavbarMenuWidget(
              hovered1: "active",
              type: "user",
            ),
            SizedBox(
              height: responsive.hp(7),
            ),
            Column(
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
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: responsive.hp(3),
                  ),
                  RoollyInput(
                    controlador: _nameController,
                    labelText: 'Nombre',
                    placeholder: 'Ingresa aqui tu nombre',
                  ),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  RoollyInput(
                    controlador: _apellidoController,
                    labelText: 'Apellido(s)',
                    placeholder: 'Ingresa aqui tu apellido(S)',
                  ),
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
                          "${_selectedDate.toLocal()}".split(' ')[0],
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
                  // RoollyInput(
                  //   type: 'email',
                  //   controlador: _emailController,
                  //   labelText: "Correo Electronico",
                  //   placeholder: "Escribe aqui tu correo",
                  // ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // RoollyInput(
                  //   type: 'password',
                  //   controlador: _passwordController,
                  //   labelText: "Contraseña",
                  //   placeholder: "Escribe aqui tu contraseña",
                  // ),
                  SizedBox(
                    height: responsive.hp(5),
                  ),
                  RoollyButton(
                    text: "Guardar",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String? email = _emailController.value.text.trim();
                        String? password = _passwordController.value.text;
                        try {
                          String? nombre = _nameController.value.text;
                          String? apellidos = _apellidoController.value.text;
                          String? username = _userNameController.value.text;
                          DateTime? fecha = _selectedDate;
                          String? genero = _genre;

                          await _firestore
                              .collection('usuarios')
                              .doc(_userId)
                              .update({
                            "nombre": nombre,
                            "apellidos": apellidos,
                            "username": username,
                            "fechanacimiento": fecha,
                            "genero": genero,
                          });
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text("Éxito"),
                                    content: Text(
                                        "Datos actualizados correctamente"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cerrar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
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
                    height: responsive.hp(5),
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
