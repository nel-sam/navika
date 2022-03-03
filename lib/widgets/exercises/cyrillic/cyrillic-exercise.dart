import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cyrillic/cyrillic-notifier.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-chart.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise-card.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/home-button-wrapper.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';
import 'package:provider/provider.dart';

class CyrillicExercise extends StatelessWidget {
  const CyrillicExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = AppLocalizations.of(context)!.cyrillic;

    return Scaffold(
      appBar: Nrs.NrsAppBar(
        title: SbcLabels.cyrillic,
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
                    const AdCard(),
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
      persistentFooterButtons: [
        NFooterMenu(buttons: [
          HomeButtonWrapper(),
          NFooterButton(
            onPressed: () {
              final dest = CyrillicChart();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dest),
              );
            },
            icon: Icons.help_center_outlined,
            text: AppLocalizations.of(context)!.cyrillic,
          )
        ])
      ],
    );
  }
}
