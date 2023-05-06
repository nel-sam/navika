import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdCard extends StatelessWidget {
  const AdCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String adUnitId;

    try {
      // 'ca-app-pub-3940256099942544/2934735716'; // TEST AD ID;

      adUnitId = Platform.isIOS
          ? 'ca-app-pub-8911581163547766/5161441469'
          : 'ca-app-pub-8911581163547766/8506817770';

      var adBanner = BannerAd(
        adUnitId: adUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(),
      );

      adBanner.load();

      return Container(
        alignment: Alignment.center,
        child: AdWidget(ad: adBanner),
        width: adBanner.size.width.toDouble(),
        height: adBanner.size.height.toDouble(),
      );
    } catch (e) {
      return Container(
        color: Colors.white,
        height: 40,
      );
    }
  }
}
