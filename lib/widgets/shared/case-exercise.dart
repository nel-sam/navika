import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/case-exercises.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer-buttons.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/shared/question-content.dart';
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

    return ChangeNotifierProvider<CaseExercises>(
      create: (context) => CaseExercises(),
      child: Consumer<CaseExercises>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (BuildContext context) => BackButton()),
            elevation: APPBAR_ELEVATION,
            backgroundColor: N.getAppBarColor(context),
            textTheme: N.getAppBarTextTheme(context),
            iconTheme: N.getAppBarIconTheme(context),
            title: Text(title, style: HEADER_TEXT_STYLE),
          ),
          endDrawer: NavikaDrawer(),
          body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Center(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: controller,
                  padding: EXERCISE_LIST_PADDING,
                  child: ChangeNotifierProvider<Settings>(
                    create: (context) => Settings(),
                    child: Consumer<Settings>(
                      builder: (context, settingsModel, child) => Column(
                        children: [
                          banner,
                          ...model.exerciseItems[caseType]!.map(
                            (QuestionStateItem e) => QuestionContent(
                              stateItem: e,
                              entryType: settingsModel.settings.entryType,
                              onChanged:
                                  (GrammarTypes grammarType, String newValue) {
                                final newItem =
                                    QuestionStateItem(combos: e.combos);

                                newItem.userAdjResponse =
                                    grammarType == GrammarTypes.Adjective
                                        ? newValue
                                        : e.userAdjResponse;

                                newItem.userNounResponse =
                                    grammarType == GrammarTypes.Noun
                                        ? newValue
                                        : e.userNounResponse;

                                newItem.userPronResponse =
                                    grammarType == GrammarTypes.PossesivePronoun
                                        ? newValue
                                        : e.userPronResponse;

                                newItem.userPersPronResponse =
                                    grammarType == GrammarTypes.PersonalPronoun
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
              )),
          persistentFooterButtons: NavikaChildFooterButtons(
            context: context,
            caseType: caseType,
            refreshFunction: () {
              N.scrollTo(0, controller);
              model.shuffle(caseType);
            },
          ),
        ),
      ),
    );
  }
}
