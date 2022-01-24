import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cases/case-notifier.dart';
import 'package:navika/state/settings.dart';
import 'package:navika/state/verbs/verb-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:navika/widgets/main-menu/main-menu.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(new NavikaApp());
}

class NavikaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black12,
      ),
      themeMode: ThemeMode.system,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Settings()),
          ChangeNotifierProvider(create: (_) => CaseNotifier()),
          ChangeNotifierProvider(create: (_) => VerbNotifier()),
        ],
        child: NHomePage(),
      ),
    );
  }
}

class NHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.NavikaAppBar(
          Text(
            APP_NAME,
            style: TextStyle(
                fontSize: 30, fontFamily: 'helvetica', color: ACCENT_COLOR),
          ),
          context,
          []),
      body: Center(
        child: Column(
          children: [
            AdCard(),
            MainMenu(),
          ],
        ),
      ),
    );
  }
}
