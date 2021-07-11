import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/shared/footer-buttons.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class CaseExercise extends StatefulWidget {
  final String title;
  final Cases caseType;
  final NavikaBanner banner;
  final List<QuestionStateItem> stateItems;
  final Function(SettingsSet) onSettingsSet;
  final void Function() refreshFunction;
  final SettingsSet settingsSet;

  const CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.banner,
    required this.onSettingsSet,
    required this.refreshFunction,
    required this.settingsSet,
    required this.stateItems,
  }) : super(key: key);

  @override
  _CaseExerciseState createState() => _CaseExerciseState();
}

class _CaseExerciseState extends State<CaseExercise> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: N.getAppBarColor(context),
          textTheme: N.getAppBarTextTheme(context),
          iconTheme: N.getAppBarIconTheme(context),
          title: Text(widget.title, style: HEADER_TEXT_STYLE),
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
                      widget.banner,
                      ...N.getPANListItems(
                        widget.stateItems,
                        widget.caseType,
                        widget.settingsSet.entryType,
                      )
                    ],
                  )),
            )),
        persistentFooterButtons: NavikaChildFooterButtons(
          context: context,
          caseType: widget.caseType,
          refreshFunction: () {
            N.scrollTo(0, controller);
            widget.refreshFunction();
          },
        ));
  }
}
