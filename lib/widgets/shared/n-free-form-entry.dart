import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/extensions.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_answer_status_icon.dart';

// TODO: Move to shared lib
class NFreeFormEntry extends StatefulWidget {
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
    final minWidth =
        (widget.correctValues[0].length * FONT_SIZE) + (FONT_SIZE * 4);

    return Padding(
      padding: const EdgeInsets.all(FONT_SIZE / 2),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth),
        child: IntrinsicWidth(
          child: TextField(
            key: widget.key,
            controller: _controller,
            style: TextStyle(fontSize: EXERCISE_FONT_SIZE),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              labelText: labelText,
              // enabledBorder: border,
              focusedBorder: border,
              suffixIcon: NAnswerStatusIcon(status: status),
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
        color = Nrs.getPrimaryColor(context);
        break;
    }

    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  CorrectStatus getCorrectStatus(String userInput) {
    if (userInput.isEmpty) {
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
}
