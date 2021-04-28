import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';

class RoollyButtonMenu extends StatelessWidget {
  final String? text;

  final Function? onPressed;
  RoollyButtonMenu({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      width: responsive.wp(100),
      height: responsive.hp(6),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(EasyColors.mylightgray)),
        onPressed: onPressed as void Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text!,
              style: TextStyle(
                fontFamily: 'Arciform',
                fontSize: responsive.dp(2.7),
                color: EasyColors.myorange,
              ),
            ),
            Icon(
              Icons.arrow_right,
              size: responsive.dp(4),
              color: EasyColors.myorange,
            )
          ],
        ),
      ),
    );
  }
}
