import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-drawer.dart';
import 'package:navika/widgets/shared/footer-buttons.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class CaseExercise extends StatefulWidget {
  final String title;
  final CaseTypeEnum caseType;
  final WordBank sourceData;
  final NavikaBanner banner;
  final StaticSentenceParts Function(Noun, bool, Adjective, Adjective)
      getStaticSentenceParts;
  final StaticSentenceParts Function(PersonalPronoun, bool)
      getPersonalPronounSentenceStaticParts;

  final Function(SettingsSet) onSettingsSet;
  final SettingsSet settingsSet;

  const CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.sourceData,
    required this.banner,
    required this.getStaticSentenceParts,
    required this.getPersonalPronounSentenceStaticParts,
    required this.onSettingsSet,
    required this.settingsSet,
  }) : super(key: key);

  @override
  _CaseExerciseState createState() => _CaseExerciseState();
}

class _CaseExerciseState extends State<CaseExercise> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = new GlobalKey<ScaffoldState>();
    List<PANExerciseItem> listItems = N.getPANCombos(
        widget.sourceData.filter(widget.settingsSet),
        widget.getStaticSentenceParts,
        widget.getPersonalPronounSentenceStaticParts);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(widget.title, style: HEADER_TEXT_STYLE),
      ),
      endDrawer: NavikaDrawer(
        initalValues: widget.settingsSet,
        onFiltersSet: (SettingsSet newSettingsSet) {
          var filterChanged = widget.settingsSet.adjectivesIncluded ==
                  newSettingsSet.adjectivesIncluded &&
              widget.settingsSet.nounsIncluded ==
                  newSettingsSet.nounsIncluded &&
              widget.settingsSet.personalPronounsIncluded ==
                  newSettingsSet.personalPronounsIncluded &&
              widget.settingsSet.possessivePronounsIncluded ==
                  newSettingsSet.possessivePronounsIncluded &&
              widget.settingsSet.entryType == newSettingsSet.entryType;

          if (filterChanged) {
            Navigator.pop(context);
            return;
          }

          setState(() {
            widget.onSettingsSet(newSettingsSet);
          });
        },
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            widget.banner,
            ...N.getPANListItems(
              listItems,
              widget.caseType,
              widget.settingsSet.entryType,
            )
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: widget.caseType,
        refreshFunction: () => setState(() {}),
      ),
    );
  }
}
