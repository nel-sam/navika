import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class FullWidthTextField extends StatefulWidget {
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final Function(String) onChanged;
  final _controller = TextEditingController();

  FullWidthTextField({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
  }) : super(key: key) {
    _controller.text = activeValue;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
  }

  @override
  State<FullWidthTextField> createState() => _FullWidthTextFieldState();
}

class _FullWidthTextFieldState extends State<FullWidthTextField> {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = getCorrectStatus(widget.activeValue);

    OutlineInputBorder border = getBorder(status);
    String labelText =
        widget.correctValues.containsCaseInsensitive(widget.activeValue)
            ? ''
            : widget.hintValue;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: N.getScreenWidth(reduction: 100),
            child: TextField(
              key: widget.key,
              controller: widget._controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(4, 18, 0, 1),
                labelText: labelText,
                enabledBorder: border,
                focusedBorder: border,
              ),
              onChanged: (String? newVal) {
                if (newVal == ' ') newVal = '';

                if (!_debounce.isActive) {
                  _debounce.cancel();
                }

                _debounce = Timer(
                  const Duration(milliseconds: DEBOUNCE_TIME),
                  () {
                    if (newVal != null &&
                        widget.correctValues.containsCaseInsensitive(newVal)) {
                      widget.onChanged(newVal);
                    }
                  },
                );
              },
            ),
          ),
          AnswerStatusIcon(status: status),
        ],
      ),
    );
  }

  CorrectStatus getCorrectStatus(String userInput) {
    if (userInput.length == 0) {
      return CorrectStatus.unstarted;
    }

    if (widget.correctValues.containsCaseInsensitive(userInput)) {
      return CorrectStatus.correct;
    }

    if (widget.correctValues.containsSubCaseInsensitive(userInput)) {
      return CorrectStatus.inprogressCorrect;
    }

    return CorrectStatus.wrong;
  }

  OutlineInputBorder getBorder(CorrectStatus status) {
    var color = WRONG_COLOR;

    switch (status) {
      case CorrectStatus.correct:
        color = CORRECT_COLOR;
        break;
      case CorrectStatus.wrong:
        color = WRONG_COLOR;
        break;
      case CorrectStatus.unstarted:
        color = Colors.grey;
        break;
      case CorrectStatus.inprogressCorrect:
        color = ACCENT_COLOR;
        break;
    }

    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
