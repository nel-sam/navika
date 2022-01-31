import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-notifier.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exec-footer-buttons.dart';
import 'package:navika/widgets/shared/exercise-header.dart';
import 'package:navika/widgets/shared/info-banner.dart';
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

    return ChangeNotifierProvider<ExerciseNavNotifier>(
      create: (context) => ExerciseNavNotifier(caseType: caseType),
      child: Consumer<ExerciseNavNotifier>(
        builder: (context, navNotifier, child) => Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (BuildContext context) => BackButton()),
            elevation: APPBAR_ELEVATION,
            backgroundColor: N.getAppBarColor(context),
            iconTheme: N.getAppBarIconTheme(context),
            title: Text(SbcLabels.cases, style: HEADER_TEXT_STYLE),
          ),
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
                          setPrevious: navNotifier.setPrevious,
                          setNext: navNotifier.setNext,
                          clear: navNotifier.clearInput,
                        ),
                        ChangeNotifierProvider<CaseNotifier>(
                          create: (context) =>
                              CaseNotifier(navNotifier.getActive),
                          child: Consumer<CaseNotifier>(
                            builder: (context, cNotifier, child) =>
                                CaseQuestionContent(
                              stateItem: cNotifier.getStateItem(),
                              entryType: EntryTypes.FreeForm,
                              onChanged:
                                  (GrammarTypes grammarType, String newValue) {
                                switch (grammarType) {
                                  case GrammarTypes.Noun:
                                    cNotifier.updateNoun(newValue);
                                    break;
                                  case GrammarTypes.PersonalPronoun:
                                    cNotifier.updatePersPronoun(newValue);
                                    break;
                                  case GrammarTypes.PossesivePronoun:
                                    cNotifier.updatePossPronoun(newValue);
                                    break;
                                  case GrammarTypes.Adjective:
                                    cNotifier.updateAdj(newValue);
                                    break;
                                }
                              },
                            ),
                          ),
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
              navNotifier.shuffleAndClear();
            },
          ),
        ),
      ),
    );
  }
}
