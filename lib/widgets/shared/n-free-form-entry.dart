import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/extensions.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

// TODO: Move to shared lib
class NFreeFormEntry extends StatefulWidget {
  final bool showHintString;
  final bool isHalfWidth;
  final String hintValue;
  final String initialValue;
  final List<String> correctValues;
  final Function(String) onChanged;
  final StateObject state = StateObject();

  NFreeFormEntry({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.initialValue,
    required this.correctValues,
    this.isHalfWidth = false,
    this.showHintString = true,
  }) : super(key: key);

  @override
  State<NFreeFormEntry> createState() => _NFreeFormEntryState();
}

class StateObject {
  String userInput = '';
}

class _NFreeFormEntryState extends State<NFreeFormEntry> {
  final _controller = TextEditingController();
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  @override
  Widget build(BuildContext context) {
    var status = getCorrectStatus(widget.state.userInput);
    final border = getBorder(context, status);
    final labelText = status == CorrectStatus.correct ? '' : widget.hintValue;
    final width = (widget.correctValues[0].length * FONT_SIZE);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: width, maxWidth: width * 1.5),
        child: IntrinsicWidth(
          child: TextField(
            key: widget.key,
            controller: _controller,
            autocorrect: false,
            style: TextStyle(fontSize: EXERCISE_FONT_SIZE),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.state.userInput.length == 0 &&
                      labelText.length > 0
                  ? labelText
                  : _getFillerString(
                      widget.state.userInput, widget.correctValues[0].length),
              contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 2),
              // hintStyle:
              //     TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
              border: border,
              enabledBorder: border,
              focusedBorder: border,

              // suffixIcon: status != CorrectStatus.unstarted
              //     ? NAnswerStatusIcon(status: status)
              //     : null,
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
      ),
    );
  }

  @override
  void didUpdateWidget(NFreeFormEntry oldWidget) {
    _controller.text = widget.initialValue.isNotEmpty
        ? widget.initialValue
        : widget.state.userInput;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    widget.state.userInput = widget.initialValue;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  OutlineInputBorder getBorder(BuildContext context, CorrectStatus status) {
    switch (status) {
      case CorrectStatus.correct:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: CORRECT_COLOR,
          ),
        );

      case CorrectStatus.wrong:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: WRONG_COLOR,
            width: 3,
          ),
        );
      case CorrectStatus.unstarted:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        );
      case CorrectStatus.inprogressCorrect:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Nrs.getPrimaryColor(context),
          ),
        );
    }
  }

  CorrectStatus getCorrectStatus(String userInput) {
    if (userInput.isEmpty) {
      return CorrectStatus.unstarted;
    }

    if (widget.correctValues.containsCaseInsensitive(userInput)) {
      return CorrectStatus.correct;
    }

    if (widget.correctValues
        .containsSubCaseInsensitive(userInput.replaceAll(BUFFER_CHARS, ''))) {
      return CorrectStatus.inprogressCorrect;
    }

    return CorrectStatus.wrong;
  }

  @override
  void initState() {
    widget.state.userInput = widget.initialValue;
    _controller.text = widget.state.userInput;
    super.initState();
  }

  updateState() {
    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (widget.state.userInput != widget.initialValue) {
        widget.onChanged(widget.state.userInput);
      }
    });
  }

  // Function that takes a string and replaces chars with underscores up to a specified length
  String _getFillerString(String str, int length) {
    if (!widget.showHintString) return '';

    var buffer = '';

    for (var i = 0; i < length; i++) {
      buffer += BUFFER_CHARS;
    }
    return buffer;
  }
}
