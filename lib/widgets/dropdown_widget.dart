import 'package:flutter/material.dart';
import 'package:roolly/generated/gen_colors.g.dart';
import 'package:roolly/utils/responsive.dart';

class RoollyDropdown extends StatefulWidget {
  final String? labelText;
  final Function(String? value)? action;

  const RoollyDropdown({Key? key, this.labelText, this.action})
      : super(key: key);

  @override
  _RoollyWidgetState createState() => _RoollyWidgetState();
}

class _RoollyWidgetState extends State<RoollyDropdown> {
  String? dropdownValue = 'Masculino';

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText!,
            style: TextStyle(
                fontFamily: 'Arciform',
                fontSize: responsive.dp(3),
                color: EasyColors.mycolorfonts)),
        SizedBox(
          height: responsive.hp(2),
        ),
        Container(
          height: responsive.hp(6),
          width: responsive.wp(100),
          decoration: BoxDecoration(
              color: EasyColors.mylightgray,
              border: Border.all(
                color: EasyColors.mylightgray,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
            child: DropdownButton<String>(
              underline: SizedBox.shrink(),
              value: dropdownValue,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: EasyColors.mycolorfonts),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
                widget.action!(dropdownValue);
              },
              items: <String>['Masculino', 'Femenino', 'Otro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
