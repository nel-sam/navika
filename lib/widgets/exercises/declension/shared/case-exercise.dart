import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-exercises.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/state/cases/case-exec-footer-buttons.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/exercises/declension/shared/case-question-content.dart';
import 'package:provider/provider.dart';

class CaseExercise extends StatelessWidget {
  final String title;
  final Cases caseType;
  final NavikaBanner banner;

  CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return ChangeNotifierProvider<Settings>(
      create: (context) => Settings(),
      child: Consumer<Settings>(
        builder: (context, settingsModel, child) =>
            ChangeNotifierProvider<CaseExercises>(
          create: (context) => CaseExercises(caseType: caseType),
          child: Consumer<CaseExercises>(
            builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading:
                    Builder(builder: (BuildContext context) => BackButton()),
                elevation: APPBAR_ELEVATION,
                backgroundColor: N.getAppBarColor(context),
                iconTheme: N.getAppBarIconTheme(context),
                title: Text(title, style: HEADER_TEXT_STYLE),
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
                      children: [
                        banner,
                        AdCard(),
                        ...model.exerciseItems[caseType]!.take(BATCH_COUNT).map(
                              (CaseQuestionStateItem e) => CaseQuestionContent(
                                stateItem: e,
                                entryType: settingsModel.settings.entryType,
                                onChanged: (GrammarTypes grammarType,
                                    String newValue) {
                                  final newItem =
                                      CaseQuestionStateItem(combos: e.combos);

                                  newItem.userAdjResponse =
                                      grammarType == GrammarTypes.Adjective
                                          ? newValue
                                          : e.userAdjResponse;

                                  newItem.userNounResponse =
                                      grammarType == GrammarTypes.Noun
                                          ? newValue
                                          : e.userNounResponse;

                                  newItem.userPossPronResponse = grammarType ==
                                          GrammarTypes.PossesivePronoun
                                      ? newValue
                                      : e.userPossPronResponse;

                                  newItem.userPersPronResponse = grammarType ==
                                          GrammarTypes.PersonalPronoun
                                      ? newValue
                                      : e.userPersPronResponse;

                                  newItem.isCorrect = newItem.checkAnswers();
                                  model.modifyStateItem(caseType, e, newItem);
                                },
                              ),
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
                  model.shuffleAndClear(caseType: caseType);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
