import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/screen2/constants/screen2_constants.dart';

class CustomDropDownMenu extends StatefulWidget {
  late String defaultValue;
  final List<String> optionsList;

  CustomDropDownMenu(
      {super.key, required this.defaultValue, required this.optionsList});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: ConstantColors_Screen2.dropDownBackground,
      style: TextStyle(color: GlobalColors.primaryHeading, fontSize: 14),
      borderRadius: BorderRadius.circular(10),
      alignment: Alignment.bottomLeft,
      isDense: true,
      elevation: 1,
      underline:SizedBox(
        width: 0,
        height: 0,
      ),
      iconSize: 18,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: GlobalColors.primaryHeading,
      ),
      value: widget.defaultValue,
      items: widget.optionsList.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.defaultValue = newValue!;
        });
      },
    );
  }
}
