import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-text.dart';

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
  final double firstColWidth = 15;

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
                  Container(width: firstColWidth),
                  ExplanationIconCell(
                    icon: N.getGenderIcon(GenderEnum.Masculine),
                  ),
                  ExplanationIconCell(
                    icon: N.getGenderIcon(GenderEnum.Feminine),
                  ),
                  ExplanationIconCell(
                    icon: N.getGenderIcon(GenderEnum.Neuter),
                  ),
                ],
              ),
              Row(children: [
                ExplanationIconCell(icon: SINGULAR_ICON, width: firstColWidth),
                ...masculineSingular,
                ...feminineSingular,
                ...neuterSingular,
              ]),
              Row(children: [
                ExplanationIconCell(icon: PLURAL_ICON, width: firstColWidth),
                ...masculinePlural,
                ...femininePlural,
                ...neuterPlural,
              ]),
              note != ''
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
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
