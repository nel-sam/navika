import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-help.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_icon_text_pair.dart';

class CaseExerciseRowCard extends StatelessWidget {
  final PANCombo combos;
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final bool isAnimate;
  final Genders gender;
  final String extraInfo;
  final String translation;
  final DialectType dialect;

  const CaseExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.isAnimate,
    required this.gender,
    required this.combos,
    required this.extraInfo,
    required this.translation,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CaseExerciseRowCardHeader(
                combos: combos,
                dialect: dialect,
                isAllCorrect: isAllCorrect,
                isPlural: isPlural,
                gender: gender,
                isAnimate: isAnimate),
            Padding(padding: EdgeInsets.only(top: FONT_SIZE * 2)),
            if (translation.length > 0)
              Text(
                translation,
                style: TextStyle(
                    fontSize: FONT_SIZE * 1.1, fontWeight: FontWeight.bold),
              ),
            Padding(padding: EdgeInsets.only(top: FONT_SIZE * 1.2)),
            this.isAllCorrect
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: N.getCorrectSentence(
                        context, this.combos.sentenceParts))
                : Wrap(
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: children.map((c) => c).toList()),
            if (this.isAllCorrect)
              Container(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Icon(
                    Icons.check_circle_outline,
                    color: CORRECT_COLOR,
                    size: 52,
                  ),
                )),
              ),
            if (extraInfo.length > 0) ExtraInfo(extraInfo: extraInfo),
          ],
        ),
      ),
    );
  }
}

class CaseExerciseRowCardHeader extends StatelessWidget {
  final PANCombo combos;

  final bool isAllCorrect;
  final bool isPlural;
  final Genders gender;
  final bool isAnimate;
  final DialectType dialect;

  const CaseExerciseRowCardHeader({
    Key? key,
    required this.isAllCorrect,
    required this.isPlural,
    required this.gender,
    required this.isAnimate,
    required this.combos,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NIconTextPair(
            icon: isPlural ? PLURAL_ICON : SINGULAR_ICON,
            text: isPlural ? N.t('plural') : N.t('singular'),
          ),
          if (this.gender != Genders.Unspecific)
            NIconTextPair(
              icon: N.getGenderIcon(this.gender),
              text: N.getGenderString(context, this.gender),
            ),
          if (isAnimate)
            NIconTextPair(
              icon: Icons.person,
              text: N.t('animate'),
            ),
          IconButton(
              onPressed: () {
                final dest =
                    CaseExerciseHelp(combos: combos, dialect: this.dialect);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dest,
                  ),
                );
              },
              color: Nrs.getPrimaryColor(context),
              icon: Icon(Icons.help)),
        ],
      ),
    );
  }
}

class ExtraInfo extends StatelessWidget {
  final String extraInfo;
  const ExtraInfo({
    Key? key,
    required this.extraInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb, color: Colors.grey),
          Expanded(
            child: Text(
              extraInfo,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
