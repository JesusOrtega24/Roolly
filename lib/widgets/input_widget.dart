import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';

class RoollyInput extends StatefulWidget {
  final String? type;
  final String? labelText;
  final String? placeholder;
  final TextEditingController controlador;
  const RoollyInput(
      {Key? key,
      this.type = 'plain',
      this.labelText = 'default',
      this.placeholder,
      required this.controlador})
      : super(key: key);

  @override
  _RoollyInputState createState() => _RoollyInputState();
}

class _RoollyInputState extends State<RoollyInput> {
  bool isValidated = false;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Visibility(
        visible: widget.type != 'join',
        child: Column(
          children: [
            Text(widget.labelText!,
                style: TextStyle(
                    fontFamily: 'Arciform',
                    fontSize: responsive.dp(3),
                    color: EasyColors.mycolorfonts)),
            SizedBox(
              height: responsive.hp(2),
            ),
          ],
        ),
      ),
      Container(
        child: TextFormField(
            controller: widget.controlador,
            maxLength: (widget.type == 'username') ? 18 : null,
            validator: (widget.type == 'email')
                ? (value) {
                    bool emailValid = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(value!);

                    if (value.isEmpty) {
                      setState(() {
                        isValidated = true;
                      });
                      return "Completa el valor";
                    } else if (!emailValid) {
                      setState(() {
                        isValidated = true;
                      });
                      return "Ingresa un email valido";
                    }
                    setState(() {
                      isValidated = false;
                    });
                    return null;
                  }
                : (widget.type == 'password')
                    ? (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            isValidated = true;
                          });

                          return "Completa el valor";
                        }
                        setState(() {
                          isValidated = false;
                        });
                        return null;
                      }
                    : (widget.type == 'username')
                        ? (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                isValidated = true;
                              });

                              return "Completa el valor";
                            }
                            setState(() {
                              isValidated = false;
                            });
                            return null;
                          }
                        : (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                isValidated = true;
                              });

                              return "Completa el valor";
                            }
                            setState(() {
                              isValidated = false;
                            });
                            return null;
                          },
            keyboardType: (widget.type == 'email')
                ? TextInputType.emailAddress
                : TextInputType.text,
            obscureText: (widget.type == 'password') ? true : false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: responsive.dp(1), horizontal: responsive.dp(2)),
                fillColor: EasyColors.mylightgray,
                filled: true,
                hintText: widget.placeholder,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                disabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))))),
      ),
    ]);
  }
}
