import 'package:flutter/material.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class PossessivePronounSection extends StatelessWidget {
  final List<Widget> contents;
  final String note;

  PossessivePronounSection({
    Key? key,
    required this.contents,
    this.note = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [NSubHeader(N.t('personalPronouns'))]),
          if (note.isNotEmpty) NTextSpan(note),
          ...contents
        ],
      ),
    );
  }
}
