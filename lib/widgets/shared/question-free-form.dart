import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';

class QuestionFreeForm extends StatefulWidget {
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final Function(String) onChanged;

  const QuestionFreeForm({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
  }) : super(key: key);

  @override
  _QuestionFreeFormState createState() => _QuestionFreeFormState();
}

class _QuestionFreeFormState extends State<QuestionFreeForm> {
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
          labelText:
              widget.correctValues.containsCaseInsensitive(widget.activeValue)
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
        color: widget.correctValues.containsCaseInsensitive(widget.activeValue)
            ? CORRECT_COLOR
            : WRONG_COLOR,
      ),
    );
  }
}
