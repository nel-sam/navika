import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class NavikaDrawer extends StatefulWidget {
  final Function(SettingsSet) onFiltersSet;
  final SettingsSet initalValues;

  const NavikaDrawer({
    Key? key,
    required this.initalValues,
    required this.onFiltersSet,
  }) : super(key: key);

  @override
  _NavikaDrawerState createState() => _NavikaDrawerState();
}

class _NavikaDrawerState extends State<NavikaDrawer> {
  late EntryTypes entryType;
  late bool pronounsChecked;
  late bool possPronounsChecked;
  late bool adjectivesChecked;
  late bool nounsChecked;
  late List<bool> entryTypeSelections;

  @override
  void initState() {
    pronounsChecked = widget.initalValues.personalPronounsIncluded;
    possPronounsChecked = widget.initalValues.possessivePronounsIncluded;
    adjectivesChecked = widget.initalValues.adjectivesIncluded;
    nounsChecked = widget.initalValues.nounsIncluded;
    entryType = widget.initalValues.entryType;
    entryTypeSelections = getEntryTypeSelections();
    super.initState();
  }

  List<bool> getEntryTypeSelections() {
    switch (entryType) {
      case EntryTypes.FreeForm:
        return [true, false, false];
      case EntryTypes.Mixed:
        return [false, true, false];
      case EntryTypes.Select:
        return [false, false, true];
    }
  }

  EntryTypes getSelectedEntryType(List<bool> entryTypeSelections) {
    int selectedInx = entryTypeSelections.indexOf(true);

    switch (selectedInx) {
      case 0:
        return EntryTypes.FreeForm;
      case 1:
        return EntryTypes.Mixed;
      case 2:
      default:
        return EntryTypes.Select;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 230,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: ACCENT_COLOR),
              child: Text(
                AppLocalizations.of(context)!.selectExercises,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.list),
                        label: Text(AppLocalizations.of(context)!.selectAll),
                        onPressed: () {
                          setState(() {
                            pronounsChecked = true;
                            possPronounsChecked = true;
                            adjectivesChecked = true;
                            nounsChecked = true;
                          });
                        },
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.close_outlined),
                        label: Text(AppLocalizations.of(context)!.unselectAll),
                        onPressed: () {
                          setState(() {
                            pronounsChecked = false;
                            possPronounsChecked = false;
                            adjectivesChecked = false;
                            //nounsChecked = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SwitchListTile(
                    value: pronounsChecked,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.personalPronouns),
                    onChanged: (bool value) {
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
                  // SwitchListTile(
                  //   value: nounsChecked,
                  //   activeColor: ACCENT_COLOR,
                  //   title: Text(AppLocalizations.of(context)!.nouns),
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //       nounsChecked = value;
                  //     });
                  //   },
                  // ),
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
                  Column(
                    children: [
                      Text(
                          'Choose exercise type'), // TODO: Multi lingual support
                      ToggleButtons(
                        children: <Widget>[
                          // TODO: Multi lingual support
                          Text('Free'),
                          Text('Mixed'),
                          Text('Select'),
                        ],
                        onPressed: (int selectedIndx) {
                          setState(() {
                            for (int i = 0;
                                i < entryTypeSelections.length;
                                i++) {
                              if (i == selectedIndx) {
                                entryTypeSelections[i] = true;
                              } else {
                                entryTypeSelections[i] = false;
                              }
                            }
                          });
                        },
                        isSelected: entryTypeSelections,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AppLocalizations.of(context)!.close)],
                      ),
                      onPressed: () => {
                        widget.onFiltersSet(
                          SettingsSet(
                            personalPronounsIncluded: pronounsChecked,
                            nounsIncluded: nounsChecked,
                            adjectivesIncluded: adjectivesChecked,
                            possessivePronounsIncluded: possPronounsChecked,
                            entryType:
                                getSelectedEntryType(entryTypeSelections),
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
