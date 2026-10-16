import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:localization/localization.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/navika_theme.dart';
import 'package:navika/widgets/menus/main_menu.dart';
import 'package:navika/widgets/settings/dialect_setting_page.dart';
import 'package:nrs_flutter_lib/themes.dart';
import 'package:nrs_flutter_lib/widgets/n_spinner.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final RequestConfiguration requestConfiguration = RequestConfiguration(
      tagForUnderAgeOfConsent: TagForUnderAgeOfConsent.yes);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

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
        textTheme: nrsTextTheme,
        appBarTheme: nrsAppBarThemeLight,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          onPrimary: Colors.white,
        ),
        appBarTheme: nrsAppBarThemeDark,
        textTheme: nrsTextTheme,
      ),
      themeMode: ThemeMode.system,
      home: NHomePage(),
    );
  }
}

class NHomePage extends StatefulWidget {
  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  late Future<bool> _isFirstTime;

  @override
  void initState() {
    super.initState();
    _isFirstTime = _loadIsFirstTime();
  }

  Future<bool> _loadIsFirstTime() async {
    try {
      return await getIsFirstTimeSetting();
    } catch (error, stackTrace) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'navika',
        context: ErrorDescription('while loading startup preferences'),
      ));
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _isFirstTime,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return NSpinner();
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('startupSettingsError'.i18n()),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isFirstTime = _loadIsFirstTime();
                        });
                      },
                      child: Text('retry'.i18n()),
                    ),
                  ],
                ),
              ),
            );
          }
          return snapshot.requireData ? DialectSettingPage() : MainMenu();
        });
  }
}
