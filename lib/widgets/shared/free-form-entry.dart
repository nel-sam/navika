import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class StateObject {
  String userInput = '';
}

class FreeFormEntry extends StatefulWidget {
  final bool isHalfWidth;
  final String hintValue;
  final String initialValue;
  final List<String> correctValues;
  final Function(String) onChanged;
  final StateObject state = StateObject();

  FreeFormEntry({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.initialValue,
    required this.correctValues,
    this.isHalfWidth = false,
  }) : super(key: key);

  @override
  State<FreeFormEntry> createState() => _FreeFormEntryState();
}

class _FreeFormEntryState extends State<FreeFormEntry> {
  final _controller = TextEditingController();
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  @override
  void initState() {
    widget.state.userInput = widget.initialValue;
    _controller.text = widget.state.userInput;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  updateState() {
    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: DEBOUNCE_TIME), () {
      if (widget.state.userInput != widget.initialValue) {
        widget.onChanged(widget.state.userInput);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log('${widget.hintValue} ${widget.state.userInput}');
    var status = getCorrectStatus(widget.state.userInput);

    OutlineInputBorder border = getBorder(status);
    String labelText = status == CorrectStatus.correct ? '' : widget.hintValue;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: widget.isHalfWidth
                ? N.getScreenWidth(halfWidth: true, reduction: 90)
                : N.getScreenWidth(reduction: 100),
            child: TextField(
              key: widget.key,
              controller: _controller,
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

                if (newVal != null && newVal != '') {
                  setState(() {
                    widget.state.userInput = newVal!;
                    status = getCorrectStatus(widget.state.userInput);
                    updateState();
                  });
                }
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
