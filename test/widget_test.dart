// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navika/constants.dart';
import 'package:navika/main.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

void main() {
  testWidgets('Main page contains menu options', (WidgetTester tester) async {
    await tester.pumpWidget(NavikaApp());
    expect(find.text(APP_NAME), findsOneWidget);
    //expect(find.textContaining(SbcLabels.cyrlilic), findsWidgets);
    expect(find.text(SbcLabels.cases), findsOneWidget);
    //expect(find.text(SbcLabels.verbs), findsOneWidget);
    //expect(find.text(SbcLabels.justTables), findsOneWidget);
    // expect(find.text(SbcLabels.grammarGuide), findsOneWidget);
  });

  testWidgets('Colors on exercise buttons', (WidgetTester tester) async {
    final testedTheme = Brightness.dark;
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: testedTheme),
      home: NavikaApp(),
    ));

    final BuildContext context = tester.element(find.byType(NavikaApp));
    expect(testedTheme, Theme.of(context).brightness);

    final bgColor = Nrs.getAppBarColor().toString();
    final expectedColor = Color.fromARGB(255, 250, 250, 250).toString();
    expect(bgColor, expectedColor);
  });

  // testWidgets('FreeForm indicates wrong answer', (WidgetTester tester) async {
  //   await tester.pumpWidget(NavikaApp());
  //   await tester.tap(find.text(SbcLabels.cases));
  //   await tester.scrollUntilVisible(find.textContaining('Nom'), 10);
  //   await tester.tap(find.textContaining('Nom'));
  // });
}
