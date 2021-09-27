import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navika/constants.dart';

class CaseFreeForm extends StatefulWidget {
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
  }) : super(key: key);

  @override
  _CaseFreeFormState createState() => _CaseFreeFormState();
}

class _CaseFreeFormState extends State<CaseFreeForm> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.activeValue == '') controller.text = '';

    return Container(
      child: TextField(
        key: widget.key,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
          labelText: widget.correctValues.contains(widget.activeValue)
              ? ''
              : widget.hintValue,
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
        onChanged: (String? newVal) {
          if (newVal != null) {
            setState(() {
              widget.onChanged(newVal);
            });
          }
        },
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.correctValues.contains(widget.activeValue)
            ? CORRECT_COLOR
            : WRONG_COLOR,
      ),
    );
  }
}
