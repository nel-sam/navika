// import 'package:flutter/material.dart';
// import 'package:navika/constants.dart';
// import 'package:navika/models/enums.dart';
// import 'package:navika/utilities/navika-helpers.dart';
// import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/akuzativ_table.dart';
// import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/dativ-lokativ_table.dart';
// import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/genitiv_table.dart';
// import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/instrumental_table.dart';
// import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/nominativ_table.dart';
// import 'package:navika/widgets/shared/home-button-wrapper.dart';
// import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
// import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
// import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

// class Tables extends StatefulWidget {
//   const Tables({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _TablesState createState() => _TablesState();
// }

// class _TablesState extends State<Tables> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = Nrs.getScreenWidth();

//     Widget tableSection(String title, Widget table) {
//       return Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 15),
//             child: NTextSpan(
//               title,
//               textAlign: TextAlign.center,
//               textStyle: Nrs.getTextStyle(context: context, isBold: true),
//             ),
//           ),
//           table,
//         ],
//       );
//     }

//     return Scaffold(
//       appBar: N.navAppBar(
//         title: SbcLabels.justTables,
//         transTitle: N.t(context).justCaseTables,
//         context: context,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
//             child: Column(
//               children: [
//                 tableSection(
//                   N.getCaseLabel(Cases.Nom),
//                   NominativDeclensionTable(),
//                 ),
//                 tableSection(
//                   N.getCaseLabel(Cases.Aku),
//                   AkuzativDeclensionTable(),
//                 ),
//                 tableSection(
//                   N.getCaseLabel(Cases.Ins),
//                   InstrumentalDeclensionTable(),
//                 ),
//                 tableSection(
//                   '${N.getCaseLabel(Cases.Lok)}/${N.getCaseLabel(Cases.Dat)}',
//                   DativLokativDeclensionTable(),
//                 ),
//                 tableSection(
//                   N.getCaseLabel(Cases.Gen),
//                   GenitivDeclensionTable(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       persistentFooterButtons: [
//         NFooterMenu(buttons: [
//           HomeButtonWrapper(),
//         ])
//       ],
//     );
//   }
// }
