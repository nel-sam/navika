import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/models.dart';

class FilterDrawer extends StatefulWidget {
  final Function(ExerciseFilterSet) onFiltersSet;
  final ExerciseFilterSet initalValues;

  const FilterDrawer({
    Key? key,
    required this.initalValues,
    required this.onFiltersSet,
  }) : super(key: key);

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late bool pronounsChecked;
  late bool possPronounsChecked;
  late bool adjectivesChecked;
  late bool nounsChecked;

  @override
  void initState() {
    pronounsChecked = widget.initalValues.personalPronounsIncluded;
    possPronounsChecked = widget.initalValues.possessivePronounsIncluded;
    adjectivesChecked = widget.initalValues.adjectivesIncluded;
    nounsChecked = widget.initalValues.nounsIncluded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: ACCENT_COLOR),
              child: Text(
                AppLocalizations.of(context)!.selectExercises,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SwitchListTile(
                    value: pronounsChecked,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.personalPronouns),
                    onChanged: (bool value) {
                      print(value);
                      setState(() {
                        pronounsChecked = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: adjectivesChecked,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.adjectives),
                    onChanged: (bool value) {
                      setState(() {
                        adjectivesChecked = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: nounsChecked,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.nouns),
                    onChanged: (bool value) {
                      setState(() {
                        nounsChecked = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: possPronounsChecked,
                    activeColor: ACCENT_COLOR,
                    title:
                        Text(AppLocalizations.of(context)!.possessivePronouns),
                    onChanged: (bool value) {
                      setState(() {
                        possPronounsChecked = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AppLocalizations.of(context)!.close)],
                      ),
                      onPressed: () => {
                        widget.onFiltersSet(
                          ExerciseFilterSet(
                            personalPronounsIncluded: pronounsChecked,
                            nounsIncluded: nounsChecked,
                            adjectivesIncluded: adjectivesChecked,
                            possessivePronounsIncluded: possPronounsChecked,
                          ),
                        )
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
