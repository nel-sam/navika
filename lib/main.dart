import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localization/localization.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/navika_theme.dart';
import 'package:navika/widgets/menus/main_menu.dart';
import 'package:navika/widgets/settings/dialect_setting_page.dart';
import 'package:nrs_flutter_lib/widgets/n_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(new NavikaApp());
}

Future<bool> getIsFirstTimeSetting() async {
  final preferences = (await SharedPreferences.getInstance());
  final isFirstTime =
      (preferences.getBool(SettingsKeys.isFirstTime.toString()) ?? true);
  return isFirstTime;
}

class NavikaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = navPalette;

    // TODO: Apply this to other apps
    final textTheme = TextTheme(
      titleLarge: TextStyle(fontSize: 42.0),
      titleMedium: TextStyle(fontSize: 39.0),
      titleSmall: TextStyle(fontSize: 22.0),
      bodyLarge: TextStyle(fontSize: 20.0),
      bodyMedium: TextStyle(fontSize: 18.0),
      bodySmall: TextStyle(fontSize: 16.0),
    );

    return MaterialApp(
      title: APP_NAME,
      localizationsDelegates: [
        LocalJsonLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'MX'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
            primary: primaryColor,
            background: const Color(0xFF212121),
            onPrimary: Colors.white),
        dividerColor: Colors.black12,
        textTheme: textTheme,
      ),
      themeMode: ThemeMode.system,
      home: NHomePage(),
    );
  }
}

class NHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIsFirstTimeSetting(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if ((snapshot.data as bool)) {
              return DialectSettingPage();
            } else {
              return MainMenu();
               ;
            }
          } else {
            return NSpinner();
          }
        });
  }
}
