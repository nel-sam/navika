import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/navika-theme.dart';
import 'package:navika/widgets/menus/main-menu.dart';
import 'package:navika/widgets/settings/dialect-setting-page.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
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

    return MaterialApp(
      //showPerformanceOverlay: true,
      //debugShowCheckedModeBanner: false,
      title: APP_NAME,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
      ),
      darkTheme: ThemeData(
        primarySwatch: primaryColor,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black12,
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
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Center(
                  child: MainMenu(),
                ),
              );
            }
          } else {
            return NavSpinner();
          }
        });
  }
}
