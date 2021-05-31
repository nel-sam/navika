import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/models.dart';

class AdjectivesExercise extends StatefulWidget {
  final WordBank bank = wordBank;

  AdjectivesExercise();

  @override
  _AdjectivesExerciseState createState() => _AdjectivesExerciseState();
}

class _AdjectivesExerciseState extends State<AdjectivesExercise> {
  List<Widget> getListItems() {
    return widget.bank.adjectives.map((e) => new Text(e.dictionary)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: getListItems(),
    ));
  }
}
