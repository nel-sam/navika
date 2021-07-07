import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class CaseFreeForm extends StatelessWidget {
  final int maxLength;
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final Function(String) onChanged;

  const CaseFreeForm({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
    required this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CaseFreeForm: ${correctValues} ${activeValue}');
    return Container(
      width: maxLength * 14,
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
          labelText: correctValues.contains(activeValue) ? '' : hintValue,
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
        onChanged: (String? newVal) {
          if (newVal != null) {
            onChanged(newVal);
          }
        },
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color:
            correctValues.contains(activeValue) ? CORRECT_COLOR : WRONG_COLOR,
      ),
    );
  }
}
