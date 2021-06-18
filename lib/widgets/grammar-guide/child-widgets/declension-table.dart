import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeclensionTable extends StatelessWidget {
  final List<NText> masculineSingular;
  final List<NText> feminineSingular;
  final List<NText> neuterSingular;
  final List<NText> masculinePlural;
  final List<NText> femininePlural;
  final List<NText> neuterPlural;
  final bool showSameAsNomNote;
  final String note;

  const DeclensionTable({
    Key? key,
    required this.masculineSingular,
    required this.feminineSingular,
    required this.neuterSingular,
    required this.masculinePlural,
    required this.femininePlural,
    required this.neuterPlural,
    this.note = '',
    this.showSameAsNomNote = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingAmount = 12.0;
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
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(GenderEnum.Masculine),
                      tooltip: AppLocalizations.of(context)!.masculine,
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(GenderEnum.Feminine),
                      tooltip: AppLocalizations.of(context)!.feminine,
                    ),
                  ),
                  Container(
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
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: SINGULAR_ICON,
                    tooltip: AppLocalizations.of(context)!.singular,
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...masculineSingular]),
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...feminineSingular]),
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(children: [...neuterSingular]),
                  ),
                ),
              ]),
              Row(children: [
                Container(
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: PLURAL_ICON,
                    tooltip: AppLocalizations.of(context)!.plural,
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...masculinePlural],
                    ),
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...femininePlural],
                    ),
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(paddingAmount),
                    child: Row(
                      children: [...neuterPlural],
                    ),
                  ),
                ),
              ]),
              showSameAsNomNote
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              paddingAmount, paddingAmount, paddingAmount, 0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: N.isDarkTheme(context)
                                      ? Colors.white
                                      : Colors.black),
                              children: [
                                TextSpan(text: '*'),
                                TextSpan(
                                    text:
                                        AppLocalizations.of(context)!.sameAsNom,
                                    style: DECLINED_LETTER_STYLE)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              note != ''
                  ? Padding(
                      padding: const EdgeInsets.all(paddingAmount),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 12,
                              color: N.isDarkTheme(context)
                                  ? Colors.white
                                  : Colors.black),
                          children: [
                            TextSpan(text: '**'),
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
