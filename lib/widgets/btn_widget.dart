import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';

class RoollyButton extends StatelessWidget {
  final String? text;
  final String? type;
  final Function? onPressed;
  final bool? disabled;
  RoollyButton({this.text, this.onPressed, this.type, this.disabled});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      width: (type == "mainbtn") ? responsive.wp(75) : responsive.wp(100),
      height: (type == "mainbtn") ? responsive.hp(7) : responsive.hp(6),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
          (type == "mainbtn")
              ? Colors.white
              : (type == "btnblue")
                  ? EasyColors.myblue
                  : (type == "btnyellow")
                      ? EasyColors.myyellow
                      : EasyColors.myorange,
        )),
        onPressed: onPressed as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Arciform',
            fontSize: responsive.dp(3),
            color: (type == "mainbtn") ? EasyColors.myorange : Colors.white,
          ),
        ),
      ),
    );
  }
}
