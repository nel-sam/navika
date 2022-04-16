import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/extensions.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_answer_status_icon.dart';

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

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: widget.isHalfWidth
                    ? Nrs.getScreenWidth(halfWidth: true, reduction: 90)
                    : Nrs.getScreenWidth(reduction: 100),
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
              NAnswerStatusIcon(status: status),
            ],
          ),
        ],
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
