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
  final String borderedItemNote;
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
    this.borderedItemNote = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colWidth = 100.0;
    const firstColWidth = 55.0;

    return Column(
      children: [
        Container(height: CELL_TEXT_PADDING + 5),
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
                      icon: N.getGenderIcon(Genders.Masculine),
                      label: 'Masc.',
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(Genders.Feminine),
                      label: 'Fem.',
                    ),
                  ),
                  Container(
                    width: colWidth,
                    child: ExplanationIconCell(
                      icon: N.getGenderIcon(Genders.Neuter),
                      label: 'Neut.',
                    ),
                  ),
                ],
              ),
              Row(children: [
                Container(
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: SINGULAR_ICON,
                    label: 'Sing.',
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Row(children: [...masculineSingular]),
                ),
                Container(
                  width: colWidth,
                  child: Row(children: [...feminineSingular]),
                ),
                Container(
                  width: colWidth,
                  child: Row(children: [...neuterSingular]),
                ),
              ]),
              Row(children: [
                Container(
                  width: firstColWidth,
                  child: ExplanationIconCell(
                    icon: PLURAL_ICON,
                    label: 'Pl.',
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Row(
                    children: [...masculinePlural],
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Row(
                    children: [...femininePlural],
                  ),
                ),
                Container(
                  width: colWidth,
                  child: Row(
                    children: [...neuterPlural],
                  ),
                ),
              ]),
              borderedItemNote != ''
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ACCENT_COLOR),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2.0),
                                  )),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: N.isDarkTheme(context)
                                      ? Colors.white
                                      : Colors.black),
                              children: [
                                TextSpan(
                                    text: borderedItemNote,
                                    style: DECLINED_LETTER_STYLE)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              note != ''
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
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
