import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';

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

class StateObject {
  String userInput = '';
}

class _FreeFormEntryState extends State<FreeFormEntry> {
  final _controller = TextEditingController();
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  @override
  Widget build(BuildContext context) {
    var status = getCorrectStatus(widget.state.userInput);
    final border = getBorder(status);
    final labelText = status == CorrectStatus.correct ? '' : widget.hintValue;
    final multipleCorrect = widget.correctValues.length > 1;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
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
              AnswerStatusIcon(status: status),
            ],
          ),
          if (multipleCorrect)
            Row(children: [
              status == CorrectStatus.correct
                  ? NTextSpan(
                      '${AppLocalizations.of(context)!.alsoCorrect}: ${widget.correctValues.join(',')}',
                      textStyle: Nrs.getTextStyle(
                          context: context, fontSize: FONT_SIZE - 3))
                  : NTextSpan(
                      '${AppLocalizations.of(context)!.multipleCorrect}',
                      textStyle: Nrs.getTextStyle(
                          context: context, fontSize: FONT_SIZE - 3))
            ]),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(FreeFormEntry oldWidget) {
    _controller.text = widget.initialValue.length > 0
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

    _debounce = Timer(const Duration(milliseconds: DEBOUNCE_TIME), () {
      if (widget.state.userInput != widget.initialValue) {
        widget.onChanged(widget.state.userInput);
      }
    });
  }
}
