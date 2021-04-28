import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';

class RoollyContainerProfile extends StatefulWidget {
  final String? id;
  final String? text;
  final String? type;
  final Function? onPressed;
  RoollyContainerProfile({this.id, this.text, this.onPressed, this.type});

  @override
  _RoollyContainerProfileState createState() => _RoollyContainerProfileState();
}

class _RoollyContainerProfileState extends State<RoollyContainerProfile> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> getUsername(String userId) async {
    String? username = "";
    await _firestore.collection('usuarios').doc(userId).get().then((snapshot) {
      username = snapshot['username'];
    });

    return username;
  }

  String name = '...';

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      getUsername(widget.id!).then((value) {
        setState(() {
          name = value!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      width: responsive.wp(100),
      height: responsive.hp(9),
      child: Container(
        decoration: BoxDecoration(
            color: EasyColors.myblue,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.hp(2)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/roollyapp.appspot.com/o/img%2Fimg_user.png?alt=media&token=5ba0bef8-dd5b-420a-8216-8d28f7b3281f",
              )),
              SizedBox(width: responsive.wp(3)),
              Text(
                (widget.id == null) ? widget.text! : name,
                style: TextStyle(
                  fontFamily: 'Arciform',
                  fontSize: responsive.dp(3),
                  color: (widget.type == "mainbtn")
                      ? EasyColors.myorange
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
