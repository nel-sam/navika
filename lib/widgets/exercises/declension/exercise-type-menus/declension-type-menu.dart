import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/settings/account-page.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/menu-footer.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class DeclensionTypeMenu extends StatelessWidget {
  final String title;
  final Cases caseType;
  final ExerciseTypes exerciseType;
  final String description;
  final String imagePath;
  final String? youtubeLink;

  DeclensionTypeMenu({
    Key? key,
    required this.title,
    required this.caseType,
    required this.description,
    required this.imagePath,
    this.exerciseType = ExerciseTypes.unspecified,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transLabel = AppLocalizations.of(context)!.selectExercises;
    final icon = NavIcons.cases;
    final title = N.getCaseLabel(caseType);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        context: context,
        title: title,
      ),
      body: SettingsConsumerWrapper(
        getChildWidget: (Settings settings) => Center(
          child: SingleChildScrollView(
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
                        imagePath: imagePath,
                        title: title,
                        exerciseType: ExerciseTypes.case_nouns,
                      ),
                      label: AppLocalizations.of(context)!.nouns,
                      transLabel: SbcLabels.nouns,
                    ),
                    NMenuButton(
                      destination: CaseExercise(
                        caseType: caseType,
                        description: description,
                        imagePath: imagePath,
                        title: title,
                        exerciseType: ExerciseTypes.case_adjectives,
                      ),
                      label: AppLocalizations.of(context)!.adjectives,
                      transLabel: SbcLabels(settings.dialectType).adjectives,
                    ),
                    settings.isPremium
                        ? NMenuButton(
                            destination: CaseExercise(
                              caseType: caseType,
                              description: description,
                              imagePath: imagePath,
                              title: title,
                              exerciseType:
                                  ExerciseTypes.case_nouns_and_adjectives,
                            ),
                            label: AppLocalizations.of(context)!
                                .nouns_and_adjectives,
                            transLabel: SbcLabels(settings.dialectType)
                                .nounsAndAdjectives,
                          )
                        : NMenuButton(
                            isPremiumLocked: true,
                            destination: AccountPage(),
                            label: AppLocalizations.of(context)!
                                .nouns_and_adjectives,
                            transLabel: SbcLabels(settings.dialectType)
                                .nounsAndAdjectives,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [MenuFooter(activeIndex: 2)],
    );
  }
}
