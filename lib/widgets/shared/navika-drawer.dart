import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:provider/provider.dart';

class NavikaDrawer extends StatelessWidget {
  late List<bool> entryTypeSelections;

  List<bool> getEntryTypeSelections(EntryTypes entryType) {
    switch (entryType) {
      case EntryTypes.FreeForm:
        return [true, false];
      // case EntryTypes.Mixed:
      //   return [false, true, false];
      case EntryTypes.Select:
        return [false, true];
    }
  }

  EntryTypes getSelectedEntryType(List<bool> entryTypeSelections) {
    int selectedInx = entryTypeSelections.indexOf(true);

    switch (selectedInx) {
      case 0:
        return EntryTypes.FreeForm;
      case 1:
      //   return EntryTypes.Mixed;
      // case 2:
      default:
        return EntryTypes.Select;
    }
  }

  @override
  Widget build(BuildContext context) {
    var typeIconPadding = const EdgeInsets.all(12);
    var settings = Provider.of<Settings>(context);

    return Container(
      // width: 230,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 130,
              child: DrawerHeader(
                decoration: BoxDecoration(color: ACCENT_COLOR),
                child: Text(
                  AppLocalizations.of(context)!.selectExercises,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.list),
                        label: Text(AppLocalizations.of(context)!.selectAll),
                        onPressed: () {
                          settings.setSettings(
                            personalPronounsIncluded: true,
                            possessivePronounsIncluded: true,
                            adjectivesIncluded: true,
                            nounsIncluded: true,
                          );
                        },
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.close_outlined),
                        label: Text(AppLocalizations.of(context)!.unselectAll),
                        onPressed: () {
                          settings.setSettings(
                            personalPronounsIncluded: false,
                            possessivePronounsIncluded: false,
                            adjectivesIncluded: false,
                            //nounsIncluded: false,
                          );
                        },
                      ),
                    ],
                  ),
                  SwitchListTile(
                    value: settings.settings.personalPronounsIncluded,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.personalPronouns),
                    onChanged: (bool value) {
                      settings.setSettings(personalPronounsIncluded: value);
                    },
                  ),
                  SwitchListTile(
                    value: settings.settings.adjectivesIncluded,
                    activeColor: ACCENT_COLOR,
                    title: Text(AppLocalizations.of(context)!.adjectives),
                    onChanged: (bool value) {
                      settings.setSettings(adjectivesIncluded: value);
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
                    value: settings.settings.possessivePronounsIncluded,
                    activeColor: ACCENT_COLOR,
                    title:
                        Text(AppLocalizations.of(context)!.possessivePronouns),
                    onChanged: (bool value) {
                      settings.setSettings(possessivePronounsIncluded: value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NText([
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .chooseExerciseType)
                          ]),
                        ),
                        ToggleButtons(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          children: <Widget>[
                            Container(
                              width: 90,
                              child: Padding(
                                padding: typeIconPadding,
                                child: Column(
                                  children: [
                                    Icon(Icons.keyboard),
                                    Text(
                                        AppLocalizations.of(context)!.freeForm),
                                  ],
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: typeIconPadding,
                            //   child: Column(
                            //     children: [
                            //       Icon(Icons.auto_awesome_mosaic_rounded),
                            //       Text(AppLocalizations.of(context)!.mixedMode),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              width: 90,
                              child: Padding(
                                padding: typeIconPadding,
                                child: Column(
                                  children: [
                                    Icon(Icons.list),
                                    Text(AppLocalizations.of(context)!
                                        .selectMode)
                                  ],
                                ),
                              ),
                            ),
                          ],
                          onPressed: (int selectedIndx) {
                            // TODO: Set in state
                            for (int i = 0;
                                i < entryTypeSelections.length;
                                i++) {
                              if (i == selectedIndx) {
                                entryTypeSelections[i] = true;
                              } else {
                                entryTypeSelections[i] = false;
                              }
                            }
                          },
                          isSelected: entryTypeSelections,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AppLocalizations.of(context)!.close)],
                      ),
                      onPressed: () {
                        settings.setSettings(
                          personalPronounsIncluded:
                              settings.settings.personalPronounsIncluded,
                          nounsIncluded: settings.settings.nounsIncluded,
                          adjectivesIncluded:
                              settings.settings.adjectivesIncluded,
                          possessivePronounsIncluded:
                              settings.settings.possessivePronounsIncluded,
                          entryType: getSelectedEntryType(entryTypeSelections),
                        );
                        Navigator.pop(context);
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
