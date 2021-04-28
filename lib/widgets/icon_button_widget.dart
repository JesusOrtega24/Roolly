import 'package:flutter/cupertino.dart';
import 'package:roolly/generated/gen_colors.g.dart';

class RoollyIconButton extends StatelessWidget {
  final String? hovered;
  final Widget? iconButton;

  const RoollyIconButton({Key? key, this.hovered, this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: (this.hovered == "active")
              ? EasyColors.myyellow
              : EasyColors.mylightgray,
          shape: BoxShape.circle,
        ),
        child: iconButton);
  }
}
