import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class NavikaDrawer extends StatelessWidget {
  final Settings settings;

  NavikaDrawer({required this.settings});

  @override
  Widget build(BuildContext context) {
    var typeIconPadding = const EdgeInsets.all(12);

    getEntryTypeSelections(EntryTypes entryType) {
      return [
        entryType == EntryTypes.FreeForm,
        entryType == EntryTypes.Mixed,
        entryType == EntryTypes.Select,
      ];
    }

    return Container(
      child:
          getDrawer(context, settings, typeIconPadding, getEntryTypeSelections),
    );
  }

  Drawer getDrawer(
      BuildContext context,
      Settings model,
      EdgeInsets typeIconPadding,
      List<bool> getEntryTypeSelections(EntryTypes entryType)) {
    return Drawer(
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
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NText(
                            AppLocalizations.of(context)!.chooseExerciseType),
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
                                  Text(AppLocalizations.of(context)!.freeForm),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: typeIconPadding,
                            child: Column(
                              children: [
                                Icon(Icons.auto_awesome_mosaic_rounded),
                                Text(AppLocalizations.of(context)!.mixedMode),
                              ],
                            ),
                          ),
                          Container(
                            width: 90,
                            child: Padding(
                              padding: typeIconPadding,
                              child: Column(
                                children: [
                                  Icon(Icons.list),
                                  Text(AppLocalizations.of(context)!.selectMode)
                                ],
                              ),
                            ),
                          ),
                        ],
                        onPressed: (int selectedIndx) => model.setSettings(
                            entryType: EntryTypes.values[selectedIndx]),
                        isSelected:
                            getEntryTypeSelections(model.settings.entryType),
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
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
