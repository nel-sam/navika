import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:provider/provider.dart';

class NominativDeclensionTable extends StatelessWidget {
  const NominativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsNotifier>(
      create: (context) => SettingsNotifier(),
      child: Center(child: Consumer<SettingsNotifier>(
        builder: (context, model, child) {
          return FutureBuilder(
            future: model.getDialect(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                DialectType dialect = snapshot.data as DialectType;
                final isSerbian = dialect == DialectType.Ekavian;

                return DeclensionTable(
                  masculineSingular: DeclensionTableCell(children: [
                    isSerbian
                        ? N.declensionExampleTextSpan('Lep')
                        : N.declensionExampleTextSpan('Lijep'),
                    N.declensionExampleTextSpan('i\n', color: MASCULINE_COLOR),
                    N.declensionExampleTextSpan('jezi'),
                    N.declensionExampleTextSpan('k', color: MASCULINE_COLOR),
                  ]),
                  masculinePlural: DeclensionTableCell(children: [
                    isSerbian
                        ? N.declensionExampleTextSpan('Lep')
                        : N.declensionExampleTextSpan('Lijep'),
                    N.declensionExampleTextSpan('i\n', color: MASCULINE_COLOR),
                    N.declensionExampleTextSpan('jezic'),
                    N.declensionExampleTextSpan('i', color: MASCULINE_COLOR),
                  ]),
                  feminineSingular: DeclensionTableCell(children: [
                    N.declensionExampleTextSpan('Moj'),
                    N.declensionExampleTextSpan('a\n', color: FEMININE_COLOR),
                    N.declensionExampleTextSpan('kuć'),
                    N.declensionExampleTextSpan('a', color: FEMININE_COLOR),
                  ]),
                  femininePlural: DeclensionTableCell(children: [
                    N.declensionExampleTextSpan('Moj'),
                    N.declensionExampleTextSpan('e\n', color: FEMININE_COLOR),
                    N.declensionExampleTextSpan('kuć'),
                    N.declensionExampleTextSpan('e', color: FEMININE_COLOR),
                  ]),
                  neuterSingular: DeclensionTableCell(children: [
                    N.declensionExampleTextSpan('Vruć'),
                    N.declensionExampleTextSpan('e\n', color: NEUTER_COLOR),
                    isSerbian
                        ? N.declensionExampleTextSpan('mlek')
                        : N.declensionExampleTextSpan('mlijek'),
                    N.declensionExampleTextSpan('o', color: NEUTER_COLOR),
                  ]),
                  neuterPlural: DeclensionTableCell(children: [
                    N.declensionExampleTextSpan('Vruć'),
                    N.declensionExampleTextSpan('a\n', color: NEUTER_COLOR),
                    isSerbian
                        ? N.declensionExampleTextSpan('mlek')
                        : N.declensionExampleTextSpan('mlijek'),
                    N.declensionExampleTextSpan('a', color: NEUTER_COLOR),
                  ]),
                );
              } else {
                return NavSpinner();
              }
            },
          );
        },
      )),
    );
  }
}
