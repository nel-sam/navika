import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'explanation-icon-cell.dart';

class DeclensionTable extends StatelessWidget {
  final List<NText> masculineSingular;
  final List<NText> feminineSingular;
  final List<NText> neuterSingular;
  final List<NText> masculinePlural;
  final List<NText> femininePlural;
  final List<NText> neuterPlural;
  final String note;

  const DeclensionTable({
    Key? key,
    required this.masculineSingular,
    required this.feminineSingular,
    required this.neuterSingular,
    required this.masculinePlural,
    required this.femininePlural,
    required this.neuterPlural,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingAmount = 8.0;
    const colWidth = 100.0;
    const firstColWidth = 45.0;

    return Column(
      children: [
        Container(height: CELL_TEXT_PADDING + 30),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: firstColWidth,
                    height: 10.0,
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.red,
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(GenderEnum.Masculine),
                      tooltip: AppLocalizations.of(context)!.masculine,
                    ),
                  ),
                  Container(
                    color: Colors.greenAccent,
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(GenderEnum.Feminine),
                      tooltip: AppLocalizations.of(context)!.feminine,
                    ),
                  ),
                  Container(
                    color: Colors.brown,
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(GenderEnum.Neuter),
                      tooltip: AppLocalizations.of(context)!.neuter,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Container(
                  color: Colors.green,
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: SINGULAR_ICON,
                    tooltip: AppLocalizations.of(context)!.singular,
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...masculineSingular]),
                  ),
                ),
                Container(
                  color: Colors.deepPurple,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...feminineSingular]),
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...neuterSingular]),
                  ),
                ),
              ]),
              Row(children: [
                Container(
                  color: Colors.amberAccent,
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: PLURAL_ICON,
                    tooltip: AppLocalizations.of(context)!.plural,
                  ),
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...masculinePlural],
                    ),
                  ),
                ),
                Container(
                  color: Colors.teal,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...femininePlural],
                    ),
                  ),
                ),
                Container(
                  color: Colors.lightGreen,
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...neuterPlural],
                    ),
                  ),
                ),
              ]),
              note != ''
                  ? Padding(
                      padding: const EdgeInsets.all(paddingAmount),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 18,
                              color: N.isDarkTheme(context)
                                  ? Colors.white
                                  : Colors.black),
                          children: [
                            TextSpan(text: '*'),
                            TextSpan(text: note, style: DECLINED_LETTER_STYLE)
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
