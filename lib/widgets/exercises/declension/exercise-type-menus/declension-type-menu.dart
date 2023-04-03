import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/settings/account-page.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class DeclensionTypeMenu extends StatelessWidget {
  final String title;
  final Cases caseType;
  final ExerciseTypes exerciseType;
  final String description;
  final String? youtubeLink;

  DeclensionTypeMenu({
    Key? key,
    required this.title,
    required this.caseType,
    required this.description,
    this.exerciseType = ExerciseTypes.unspecified,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transLabel = N.t('selectExercises');
    final icon = NavIcons.cases;
    final title = N.getCaseLabel(caseType);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        context: context,
        title: title,
      ),
      body: SettingsConsumerWrapper(
        getChildWidget: (Settings settings) {
          var nounsAndAdjs = settings.isPremium
              ? NMenuButton(
                  destination: CaseExercise(
                    caseType: caseType,
                    description: description,
                    youtubeLink: youtubeLink,
                    title: title,
                    exerciseType: ExerciseTypes.case_nouns_and_adjectives,
                  ),
                  label: '${N.t('level_4')}: ${N.t('nouns_and_adjectives')}',
                  transLabel:
                      SbcLabels(settings.dialectType).nounsAndAdjectives,
                )
              : NMenuButton(
                  isPremiumLocked: true,
                  destination: AccountPage(),
                  label: '${N.t('level_4')}: ${N.t('nouns_and_adjectives')}',
                  transLabel:
                      SbcLabels(settings.dialectType).nounsAndAdjectives,
                );

          return Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: N.getMaxScreenWidth(),
                child: Column(
                  children: [
                    const AdCard(),
                    NMenuHeader(
                      icon: icon,
                      transLabel: transLabel,
                      label: SbcLabels(settings.dialectType).exerciseType,
                    ),
                    Column(
                      children: [
                        NMenuButton(
                          destination: CaseExercise(
                            caseType: caseType,
                            description: description,
                            youtubeLink: youtubeLink,
                            title: title,
                            exerciseType: ExerciseTypes.case_nouns,
                          ),
                          label: '${N.t('level_1')}: ${N.t('nouns')}',
                          transLabel: SbcLabels.nouns,
                        ),
                        NMenuButton(
                          destination: CaseExercise(
                            caseType: caseType,
                            description: description,
                            youtubeLink: youtubeLink,
                            title: title,
                            exerciseType: ExerciseTypes.case_personal_pronouns,
                          ),
                          label:
                              '${N.t('level_2')}: ${N.t('personalPronouns')}',
                          transLabel:
                              SbcLabels(settings.dialectType).personalPronouns,
                        ),
                        NMenuButton(
                          destination: CaseExercise(
                            caseType: caseType,
                            description: description,
                            youtubeLink: youtubeLink,
                            title: title,
                            exerciseType: ExerciseTypes.case_adjectives,
                          ),
                          label: '${N.t('level_3')}: ${N.t('adjectives')}',
                          transLabel:
                              SbcLabels(settings.dialectType).adjectives,
                        ),
                        FLAG_PREMIUM_FEATURE ? nounsAndAdjs : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      //persistentFooterButtons: [MenuFooter(activeIndex: 2)],
    );
  }
}
