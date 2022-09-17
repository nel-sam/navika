import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-help.dart';
import 'package:navika/widgets/shared/shadow-box.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_icon_text_pair.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';

class CaseExerciseRowCard extends StatelessWidget {
  final PANCombo combos;
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final bool isAnimate;
  final Genders gender;
  final String extraInfo;
  final String translation;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Nrs.getScreenWidth();

    return Container(
      height: 350,
      child: ShadowBox(
        isCorrect: this.isAllCorrect,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CaseExerciseRowCardHeader(
                  combos: combos,
                  isAllCorrect: isAllCorrect,
                  isPlural: isPlural,
                  gender: gender,
                  isAnimate: isAnimate),
              if (translation.length > 0)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      translation,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: FONT_SIZE),
                    ),
                  ),
                ),
              if (extraInfo.length > 0)
                ExtraInfo(screenWidth: screenWidth, extraInfo: extraInfo),
              Padding(padding: const EdgeInsets.all(14)),
              this.isAllCorrect
                  ? Center(
                      child: NTextMulti(N.getCorrectSentence(
                          context, this.combos.sentenceParts)),
                    )
                  : Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: children.map((c) => c).toList()),
              if (this.isAllCorrect)
                Container(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: CORRECT_COLOR,
                      size: 48,
                    ),
                  )),
                )
            ],
          ),
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
  const CaseExerciseRowCardHeader({
    Key? key,
    required this.isAllCorrect,
    required this.isPlural,
    required this.gender,
    required this.isAnimate,
    required this.combos,
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
                final dest = CaseExerciseHelp(combos: combos);

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
  final double screenWidth;

  final String extraInfo;
  const ExtraInfo({
    Key? key,
    required this.screenWidth,
    required this.extraInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
        width: screenWidth,
        child: Text(
          extraInfo,
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
