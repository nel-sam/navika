import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercise-selection/exercise-selection.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(new MyApp());
}

final BannerAd adBanner = BannerAd(
  //adUnitId: 'ca-app-pub-3940256099942544/2934735716', // TEST AD ID
  adUnitId: Platform.isIOS
      ? 'ca-app-pub-8911581163547766/5161441469'
      : 'ca-app-pub-8911581163547766/8506817770',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navika',
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
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    adBanner.load();

    return Scaffold(
      appBar: N.NavikaAppBar(
          Image(width: 100, image: AssetImage('assets/logo_small.png')),
          context, []),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: adBanner),
              width: adBanner.size.width.toDouble(),
              height: adBanner.size.height.toDouble(),
            ),
            ExerciseSelection(),
          ],
        ),
      ),
    );
  }
}
