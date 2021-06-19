import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExerciseRowCard extends StatelessWidget {
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final GenderEnum gender;

  const ExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.gender,
  }) : super(key: key);

  String getGenderString(BuildContext context) {
    switch (gender) {
      case GenderEnum.Masculine:
        return AppLocalizations.of(context)!.masculine;
      case GenderEnum.Feminine:
        return AppLocalizations.of(context)!.feminine;
      case GenderEnum.Neuter:
        return AppLocalizations.of(context)!.neuter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border:
            Border.all(color: this.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR),
        borderRadius: BorderRadius.all(Radius.circular(CELL_TEXT_PADDING)),
      ),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          getHeader(context),
          getBody(),
        ],
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          CELL_TEXT_PADDING * 2, CELL_TEXT_PADDING, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children
            .map((c) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: c,
                ))
            .toList(),
      ),
    );
  }

  Container getHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR,
        border:
            Border.all(color: this.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CELL_TEXT_PADDING),
            topRight: Radius.circular(CELL_TEXT_PADDING),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(CARD_PADDING),
            child: this.isAllCorrect
                ? Icon(Icons.check_circle_outline)
                : Icon(Icons.cancel_sharp),
          ),
          Row(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CARD_PADDING * 3, CARD_PADDING, 5, CARD_PADDING),
                  child: Icon(N.getGenderIcon(this.gender)),
                ),
                Text(getGenderString(context)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      CARD_PADDING * 3, CARD_PADDING, 5, CARD_PADDING),
                  child: Icon(isPlural ? PLURAL_ICON : SINGULAR_ICON),
                ),
                Text(isPlural
                    ? AppLocalizations.of(context)!.plural
                    : AppLocalizations.of(context)!.singular),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
