import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/shared/footer-buttons.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/widgets/shared/question-content.dart';
import 'package:provider/provider.dart';

class CaseExercise extends StatelessWidget {
  final String title;
  final Cases caseType;
  final NavikaBanner banner;
  final List<QuestionStateItem> stateItems;

  CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.banner,
    required this.stateItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Settings>(context);
    final controller = ScrollController();

    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: N.getAppBarColor(context),
          textTheme: N.getAppBarTextTheme(context),
          iconTheme: N.getAppBarIconTheme(context),
          title: Text(title, style: HEADER_TEXT_STYLE),
        ),
        endDrawer: NavikaDrawer(),
        body: new GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Center(
              child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: controller,
                  padding: EXERCISE_LIST_PADDING,
                  child: Column(
                    children: [
                      banner,
                      ...stateItems
                          .map((QuestionStateItem e) => QuestionContent(
                                stateItem: e,
                                entryType: provider.settings.entryType,
                              ))
                    ],
                  )),
            )),
        persistentFooterButtons: NavikaChildFooterButtons(
          context: context,
          caseType: caseType,
          refreshFunction: () {
            N.scrollTo(0, controller);
            stateItems.shuffle();
          },
        ));
  }
}
