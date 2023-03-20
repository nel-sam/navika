import 'package:flutter/material.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/widgets/n_navigation_header.dart';

class ExerciseNavigationWrapper extends StatelessWidget {
  final ExerciseNavNotifier navNotifier;

  const ExerciseNavigationWrapper({
    Key? key,
    required this.navNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NNavigationHeader(
        setPrevious: navNotifier.setPrevious,
        setNext: navNotifier.setNext,
        clear: navNotifier.clearInput,
        getProgressPercentage: navNotifier.getProgressPercentage,
        previousText: N.t('previous'),
        nextText: N.t('next'),
        clearText: N.t('clear'),
        exerciseText: N.t('exercise'));
  }
}
