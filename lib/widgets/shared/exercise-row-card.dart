import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/exercise-help.dart';

class ExerciseRowCard extends StatelessWidget {
  final PANCombo combos;
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final bool isAnimate;
  final Genders gender;

  const ExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.isAnimate,
    required this.gender,
    required this.combos,
  }) : super(key: key);

  String getGenderString(BuildContext context) {
    switch (gender) {
      case Genders.Masculine:
        return AppLocalizations.of(context)!.masculine;
      case Genders.Feminine:
        return AppLocalizations.of(context)!.feminine;
      case Genders.Neuter:
      case Genders.Unspecific:
        return AppLocalizations.of(context)!.neuter;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = N.isDarkTheme(context)
        ? Theme.of(context).backgroundColor
        : Colors.white;

    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                    color: this.isAllCorrect
                        ? CORRECT_COLOR.withOpacity(0.4)
                        : WRONG_COLOR.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getHeader(context, combos),
                  getBody(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          CELL_TEXT_PADDING * 2, CELL_TEXT_PADDING * 4, 0, 0),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children
              .map((c) => Padding(padding: const EdgeInsets.all(3), child: c))
              .toList()),
    );
  }

  // ignore: non_constant_identifier_names
  Widget IconTextPair(IconData icon, String text) {
    const double iconPadding = 4;

    return Container(
      //width: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: iconPadding),
              child: Icon(
                icon,
                color: ACCENT_COLOR,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget getHeader(BuildContext context, PANCombo combos) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: this.isAllCorrect
                ? Icon(Icons.check_circle_outline, color: CORRECT_COLOR)
                : Icon(Icons.close_outlined, color: WRONG_COLOR),
          ),
          IconTextPair(
            N.getGenderIcon(this.gender),
            getGenderString(context),
          ),
          IconTextPair(
            isPlural ? PLURAL_ICON : SINGULAR_ICON,
            isPlural
                ? AppLocalizations.of(context)!.plural
                : AppLocalizations.of(context)!.singular,
          ),
          if (isAnimate)
            IconTextPair(
              Icons.person,
              AppLocalizations.of(context)!.animate,
            ),
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseHelp(combos: combos),
                      ),
                    ),
                  },
              icon: Icon(Icons.help))
        ],
      ),
    );
  }
}
