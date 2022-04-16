import 'package:flutter/material.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/widgets/n_navigation_header.dart';

class NavigationHeaderWrapper extends StatelessWidget {
  final ExerciseNavNotifier navNotifier;

  const NavigationHeaderWrapper({
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
        previousText: N.t(context).previous,
        nextText: N.t(context).next,
        clearText: N.t(context).clear,
        exerciseText: N.t(context).exercise);
  }
}
