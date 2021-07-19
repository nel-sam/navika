import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/explanation-icon-cell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeclensionTable extends StatelessWidget {
  final DeclensionTableCell masculineSingular;
  final DeclensionTableCell masculinePlural;

  final DeclensionTableCell feminineSingular;
  final DeclensionTableCell femininePlural;

  final DeclensionTableCell neuterSingular;
  final DeclensionTableCell neuterPlural;

  final String borderedItemNote;
  final bool showEqualItemNote;
  final Color additionalEqualItemColor;
  final List<String>? notes;

  const DeclensionTable({
    Key? key,
    required this.masculineSingular,
    required this.feminineSingular,
    required this.neuterSingular,
    required this.masculinePlural,
    required this.femininePlural,
    required this.neuterPlural,
    this.notes,
    this.borderedItemNote = '',
    this.showEqualItemNote = false,
    this.additionalEqualItemColor = EQUAL_ITEMS_BORDER_COLOR,
  }) : super(key: key);

  String getAsterix(int count) {
    var result = '';

    for (int i = 0; i < count; i++) {
      result += '*';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            // Column 1
            children: [
              Container(height: 62),
              Container(
                child: ExplanationIconCell(
                  icon: SINGULAR_ICON,
                  label: AppLocalizations.of(context)!.singular,
                ),
              ),
              Container(
                child: ExplanationIconCell(
                  icon: PLURAL_ICON,
                  label: AppLocalizations.of(context)!.plural,
                ),
              ),
            ],
          ),
          Column(
            // Column 2
            children: [
              Container(
                child: Center(
                  child: ExplanationIconCell(
                    icon: N.getGenderIcon(Genders.Feminine),
                    label: AppLocalizations.of(context)!.feminine,
                  ),
                ),
              ),
              feminineSingular,
              femininePlural,
            ],
          ),
          Column(
            // Column 3
            children: [
              Container(
                child: Center(
                  child: ExplanationIconCell(
                    icon: N.getGenderIcon(Genders.Masculine),
                    label: AppLocalizations.of(context)!.masculine,
                  ),
                ),
              ),
              masculineSingular,
              masculinePlural
            ],
          ),
          Column(
            // Column 4
            children: [
              Container(
                child: Center(
                  child: ExplanationIconCell(
                    icon: N.getGenderIcon(Genders.Neuter),
                    label: AppLocalizations.of(context)!.neuter,
                  ),
                ),
              ),
              neuterSingular,
              neuterPlural
            ],
          )
        ],
      ),
    );
  }
}
