import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/menus/main_menu.dart';
import 'package:navika/widgets/settings/dialect_setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('missing first-time preference starts onboarding', () async {
    expect(await getIsFirstTimeSetting(), isTrue);
  });

  test('saved first-time preference is preserved', () async {
    for (final isFirstTime in [true, false]) {
      SharedPreferences.setMockInitialValues({
        SettingsKeys.isFirstTime.toString(): isFirstTime,
      });
      expect(await getIsFirstTimeSetting(), isFirstTime);
    }
  });

  testWidgets('startup routes both preference values without a cast',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: NHomePage()));
    final builder = tester.widget<FutureBuilder<bool>>(
      find.byType(FutureBuilder<bool>),
    );
    final context = tester.element(find.byType(NHomePage));

    expect(
      builder.builder(
          context,
          const AsyncSnapshot.withData(
            ConnectionState.done,
            true,
          )),
      isA<DialectSettingPage>(),
    );
    expect(
      builder.builder(
          context,
          const AsyncSnapshot.withData(
            ConnectionState.done,
            false,
          )),
      isA<MainMenu>(),
    );
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('startup keeps the same future across rebuilds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: NHomePage()));
    final initialFuture = tester
        .widget<FutureBuilder<bool>>(find.byType(FutureBuilder<bool>))
        .future;
    tester.element(find.byType(NHomePage)).markNeedsBuild();
    await tester.pump();
    expect(
      tester
          .widget<FutureBuilder<bool>>(find.byType(FutureBuilder<bool>))
          .future,
      same(initialFuture),
    );
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('preference failure is reported and can be retried',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      SettingsKeys.isFirstTime.toString(): 'invalid',
    });
    await tester.pumpWidget(NavikaApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isA<TypeError>());
    expect(
      find.text('Unable to load your settings. Please try again.'),
      findsOneWidget,
    );
    expect(find.byType(DialectSettingPage), findsNothing);
    expect(find.byType(MainMenu), findsNothing);

    SharedPreferences.setMockInitialValues({});
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(find.byType(DialectSettingPage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
