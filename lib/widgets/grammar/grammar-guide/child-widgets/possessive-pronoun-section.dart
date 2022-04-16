import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';

class PossessivePronounSection extends StatelessWidget {
  final List<Widget> contents;

  const PossessivePronounSection({
    Key? key,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              NSubHeader(AppLocalizations.of(context)!.personalPronouns)
            ],
          ),
          ...contents
        ],
      ),
    );
  }
}
