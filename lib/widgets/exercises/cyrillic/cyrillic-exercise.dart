import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cyrillic/cyrillic-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exec-footer-buttons.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise-card.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CyrillicExercise extends StatelessWidget {
  const CyrillicExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = AppLocalizations.of(context)!.cyrillic;

    return Scaffold(
      appBar: N.NavikaAppBar(
        title: SbcLabels.cyrlilic,
        context: context,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<CyrillicNotifier>(
          create: (context) => CyrillicNotifier(),
          child: Consumer<CyrillicNotifier>(
            builder: (context, model, child) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InfoBanner(
                      imagePath: 'assets/banners/writing.jpg',
                      label: title,
                      description: AppLocalizations.of(context)!.cyrillicDesc,
                      //youtubeLink: RECOMMENDED_VIDEO_CYRILLIC,
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
      ),
      persistentFooterButtons:
          CyrillicExecFooterButtons(context: context, refreshFunction: () {}),
    );
  }
}
