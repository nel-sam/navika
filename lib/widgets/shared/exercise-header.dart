import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/icon-text-button.dart';

class ExerciseHeader extends StatelessWidget {
  final Function setPrevious;
  final Function setNext;
  final Function clear;
  final Function getCounter;

  const ExerciseHeader({
    Key? key,
    required this.setPrevious,
    required this.setNext,
    required this.clear,
    required this.getCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = getCounter();

    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(counter)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconTextButton(
                text: AppLocalizations.of(context)!.previous,
                onPressed: setPrevious,
                icon: Icons.skip_previous_outlined,
              ),
              IconTextButton(
                text: AppLocalizations.of(context)!.clear,
                onPressed: clear,
                icon: Icons.refresh_outlined,
              ),
              IconTextButton(
                text: AppLocalizations.of(context)!.next,
                onPressed: setNext,
                icon: Icons.skip_next_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
