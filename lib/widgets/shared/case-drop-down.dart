import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class CaseDropDown extends StatelessWidget {
  final String activeValue;
  final String correctValue;
  final Function(String) onChanged;
  final List<DropdownMenuItem<String>> dropDownOptions;

  const CaseDropDown(
      {Key? key,
      required this.activeValue,
      required this.correctValue,
      required this.onChanged,
      required this.dropDownOptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: activeValue,
      iconSize: 24,
      underline: Container(
        height: 1,
        color: activeValue == correctValue ? CORRECT_COLOR : WRONG_COLOR,
      ),
      onChanged: (String? newVal) {
        if (newVal != null) {
          onChanged(newVal);
        }
      },
      items: dropDownOptions,
    );
  }
}
