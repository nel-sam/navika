import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cyrillic/cyrillic-exercises.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exec-footer-buttons.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise-card.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CyrillicExercise extends StatelessWidget {
  const CyrillicExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = AppLocalizations.of(context)!.cyrillic;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(title, style: HEADER_TEXT_STYLE),
      ),
      body: ChangeNotifierProvider<CyrillicExercises>(
        create: (context) => CyrillicExercises(),
        child: Consumer<CyrillicExercises>(
          builder: (context, model, child) => Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavikaBanner(
                    imagePath: 'assets/banners/writing.jpg',
                    caseName: title,
                    description: AppLocalizations.of(context)!.cyrillicDesc,
                    //youtubeLink: RECOMMENDED_VIDEO_CYRILLIC,
                    icons: [
                      Icons.note,
                    ],
                  ),
                  AdCard(),
                  ...model.exerciseItems.map(
                    (e) => CyrillicExerciseCard(
                      state: e,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons:
          CyrillicExecFooterButtons(context: context, refreshFunction: () {}),
    );
  }
}
