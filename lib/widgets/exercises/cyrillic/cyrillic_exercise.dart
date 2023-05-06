import 'package:flutter/material.dart';
import 'package:navika/state/cyrillic/cyrillic_notifier.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic_chart.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic_exercise_card.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:navika/widgets/shared/home_button_wrapper.dart';
import 'package:navika/widgets/shared/info_banner.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class CyrillicExercise extends StatelessWidget {
  const CyrillicExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = N.t('cyrillic');

    return Scaffold(
      appBar: N.navAppBar(
        title: SbcLabels.cyrillic,
        context: context,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<CyrillicNotifier>(
          create: (context) => CyrillicNotifier(),
          child: Consumer<CyrillicNotifier>(
            builder: (context, model, child) => Center(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InfoBanner(
                          label: title,
                          description: N.t('cyrillicDesc'),
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
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        NFooterMenu(buttons: [
          HomeButtonWrapper(isActive: false),
          NFooterButton(
            active: true,
            onPressed: () {
              final dest = CyrillicChart();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dest),
              );
            },
            icon: Icons.help_center_outlined,
            text: N.t('cyrillic'),
          )
        ])
      ],
    );
  }
}
