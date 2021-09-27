import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-help.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';

class CaseExerciseRowCard extends StatelessWidget {
  final PANCombo combos;
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final bool isAnimate;
  final Genders gender;

  const CaseExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.isAnimate,
    required this.gender,
    required this.combos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final bgColor = N.isDarkTheme(context)
        ? Theme.of(context).backgroundColor
        : Colors.white;

    return Container(
      width: screenWidth > 840 ? screenWidth / 2.5 : screenWidth,
      child: Row(
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
      ),
    );
  }

  Widget getHeader(BuildContext context, PANCombo combos) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: this.isAllCorrect
                ? Icon(Icons.check_circle_outline, color: CORRECT_COLOR)
                : Icon(Icons.close_outlined, color: WRONG_COLOR),
          ),
          IconTextPair(
            icon: N.getGenderIcon(this.gender),
            text: N.getGenderString(context, this.gender),
          ),
          IconTextPair(
            icon: isPlural ? PLURAL_ICON : SINGULAR_ICON,
            text: isPlural
                ? AppLocalizations.of(context)!.plural
                : AppLocalizations.of(context)!.singular,
          ),
          if (isAnimate)
            IconTextPair(
              icon: Icons.person,
              text: AppLocalizations.of(context)!.animate,
            ),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CaseExerciseHelp(combos: combos),
                      ),
                    ),
                  },
              child: Icon(Icons.help)),
        ],
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children
              .map((c) => Padding(padding: const EdgeInsets.all(3), child: c))
              .toList()),
    );
  }
}
