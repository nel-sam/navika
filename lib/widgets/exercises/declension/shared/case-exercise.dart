import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/state/cases/case-exec-footer-buttons.dart';
import 'package:navika/widgets/shared/exercise-header.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/exercises/declension/shared/case-question-content.dart';
import 'package:provider/provider.dart';

class CaseExercise extends StatelessWidget {
  final String title;
  final Cases caseType;
  final String description;
  final String imagePath;
  final String? youtubeLink;

  CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.description,
    required this.imagePath,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return ChangeNotifierProvider<Settings>(
      create: (context) => Settings(),
      child: Consumer<Settings>(
        builder: (context, settingsModel, child) =>
            ChangeNotifierProvider<ExerciseNavNotifier>(
          create: (context) => ExerciseNavNotifier(caseType: caseType),
          child: Consumer<ExerciseNavNotifier>(
            builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading:
                    Builder(builder: (BuildContext context) => BackButton()),
                elevation: APPBAR_ELEVATION,
                backgroundColor: N.getAppBarColor(context),
                iconTheme: N.getAppBarIconTheme(context),
                title: Text(APP_NAME, style: HEADER_TEXT_STYLE),
              ),
              endDrawer: NavikaDrawer(settings: settingsModel),
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Center(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    controller: controller,
                    padding: EXERCISE_LIST_PADDING,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InfoBanner(
                          imagePath: imagePath,
                          label: title,
                          description: description,
                          youtubeLink: youtubeLink,
                        ),
                        AdCard(),
                        Column(
                          children: [
                            ExerciseHeader(
                              setPrevious: model.setPrevious,
                              setNext: model.setNext,
                              clear: model.clearInput,
                            ),
                            CaseQuestionContent(
                              stateItem: model.getActive(),
                              entryType: settingsModel.settings.entryType,
                              onChanged:
                                  (GrammarTypes grammarType, String newValue) {
                                switch (grammarType) {
                                  case GrammarTypes.Noun:
                                    model.updateNoun(newValue);
                                    break;
                                  case GrammarTypes.PersonalPronoun:
                                    model.updatePersPronoun(newValue);
                                    break;
                                  case GrammarTypes.PossesivePronoun:
                                    model.updatePossPronoun(newValue);
                                    break;
                                  case GrammarTypes.Adjective:
                                    model.updateAdj(newValue);
                                    break;
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              persistentFooterButtons: CaseExecFooterButtons(
                context: context,
                caseType: caseType,
                refreshFunction: () {
                  N.scrollTo(0, controller);
                  model.shuffleAndClear();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
