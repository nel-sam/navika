import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise-help.dart';
import 'package:navika/widgets/shared/shadow-box.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_icon_text_pair.dart';

class CaseExerciseRowCard extends StatelessWidget {
  final PANCombo combos;
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final bool isAnimate;
  final Genders gender;
  final String Function(BuildContext context)? getExtraInfo;

  const CaseExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.isAnimate,
    required this.gender,
    required this.combos,
    required this.getExtraInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Nrs.getScreenWidth();
    final extraInfo = this.getExtraInfo!(context);

    return Container(
      height: 350,
      child: ShadowBox(
        isCorrect: this.isAllCorrect,
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
            if (extraInfo.length > 0)
              ExtraInfo(screenWidth: screenWidth, extraInfo: extraInfo),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: children.map((c) => c).toList()),
            ),
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
