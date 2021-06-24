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
  final StaticSentenceParts Function(Noun, bool, Adjective)
      getStaticSentenceParts;
  final StaticSentenceParts Function(PersonalPronoun, bool)
      getPersonalPronounSentenceStaticParts;

  final Function(ExerciseFilterSet) onFilterSet;
  final ExerciseFilterSet filterSet;

  const CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.sourceData,
    required this.banner,
    required this.getStaticSentenceParts,
    required this.getPersonalPronounSentenceStaticParts,
    required this.onFilterSet,
    required this.filterSet,
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
        widget.sourceData.filter(widget.filterSet),
        widget.getStaticSentenceParts,
        widget.getPersonalPronounSentenceStaticParts);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(widget.title),
      ),
      endDrawer: NavikaDrawer(
        initalValues: widget.filterSet,
        onFiltersSet: (ExerciseFilterSet newFilterSet) {
          var filterChanged = widget.filterSet.adjectivesIncluded ==
                  newFilterSet.adjectivesIncluded &&
              widget.filterSet.nounsIncluded == newFilterSet.nounsIncluded &&
              widget.filterSet.personalPronounsIncluded ==
                  newFilterSet.personalPronounsIncluded &&
              widget.filterSet.possessivePronounsIncluded ==
                  newFilterSet.possessivePronounsIncluded;

          if (filterChanged) {
            Navigator.pop(context);
            return;
          }

          setState(() {
            widget.onFilterSet(newFilterSet);
          });
        },
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            widget.banner,
            ...N.getPANListItems(listItems, widget.caseType)
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
