import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/state/word-order/word-order-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/exercise-header.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WordOrderExercise extends StatelessWidget {
  const WordOrderExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(title: SbcLabels.wordOrder, context: context),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<ExerciseNavNotifier>(
          create: (context) => ExerciseNavNotifier(isVerb: true),
          child: Consumer<ExerciseNavNotifier>(
            builder: (context, navNotifier, child) => Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoBanner(
                      imagePath: 'assets/banners/flags.jpg',
                      label: AppLocalizations.of(context)!.word_order,
                      description:
                          AppLocalizations.of(context)!.word_order_desc,
                      //youtubeLink: youtubeLink,
                    ),
                    AdCard(),
                    ExerciseHeader(
                      setPrevious: navNotifier.setPrevious,
                      setNext: navNotifier.setNext,
                      clear: navNotifier.clearInput,
                    ),
                    ChangeNotifierProvider<WordOrderNotifier>(
                      create: (context) =>
                          WordOrderNotifier(navNotifier.getActive),
                      child: Consumer<WordOrderNotifier>(
                        builder: (context, wordOrderNotifier, child) =>
                            Container(child: Container()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
