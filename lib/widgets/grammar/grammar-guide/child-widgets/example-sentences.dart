import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';

class ExampleSentences extends StatelessWidget {
  final List<Widget> sentences;

  const ExampleSentences({
    Key? key,
    required this.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NSubHeader(AppLocalizations.of(context)!.exampleSentences),
            ...sentences
          ],
        ),
      ],
    );
  }
}
