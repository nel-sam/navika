import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/akuzativ-table.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/dativ-lokativ-table.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/genitiv-table.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/instrumental-table.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/nominativ-table.dart';
import 'package:navika/widgets/shared/home-button.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';

class Tables extends StatefulWidget {
  const Tables({
    Key? key,
  }) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();

    Widget tableSection(String title, Widget table) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: NTextSpan(
              title,
              textAlign: TextAlign.center,
              textStyle: Nrs.getTextStyle(context: context, isBold: true),
            ),
          ),
          table,
        ],
      );
    }

    return Scaffold(
      appBar: Nrs.NrsAppBar(
        title: SbcLabels.justTables,
        transTitle: AppLocalizations.of(context)!.justCaseTables,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
            child: Column(
              children: [
                tableSection(
                  N.getCaseLabel(Cases.Nom),
                  NominativDeclensionTable(),
                ),
                tableSection(
                  N.getCaseLabel(Cases.Aku),
                  AkuzativDeclensionTable(),
                ),
                tableSection(
                  N.getCaseLabel(Cases.Ins),
                  InstrumentalDeclensionTable(),
                ),
                tableSection(
                  '${N.getCaseLabel(Cases.Lok)}/${N.getCaseLabel(Cases.Dat)}',
                  DativLokativDeclensionTable(),
                ),
                tableSection(
                  N.getCaseLabel(Cases.Gen),
                  GenitivDeclensionTable(),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButton(context),
          ],
        ),
      ],
    );
  }
}
