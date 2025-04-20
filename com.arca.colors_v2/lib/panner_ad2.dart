import 'dart:developer';

import 'package:colors_v2/adi2.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late double scc2 = AdSize.mediumRectangle.width.toDouble();

class Adpanner2 extends StatefulWidget {
  const Adpanner2({super.key});

  @override
  State<Adpanner2> createState() => _Adpanner2State();
}

class _Adpanner2State extends State<Adpanner2> {
  late BannerAd bannerAd2;
  bool _isAdReady2 = false;
  final AdSize _adSize = AdSize.mediumRectangle;
  void _creatpannerAd2() {
    bannerAd2 = BannerAd(
      size: _adSize,
      adUnitId: adi2.bannerAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          _isAdReady2 = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        log('ad failed to load: ${error.message}');
      }),
      request: const AdRequest(),
    );
    bannerAd2.load();
  }

  @override
  void initState() {
    super.initState();
    _creatpannerAd2();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdReady2) {
      return Container(
        // color: Colors.red,
        // width: 500,
        // height: 40,
        width: _adSize.width.toDouble(),
        height: _adSize.height.toDouble(),
        child: AdWidget(
          ad: bannerAd2,
        ),
        alignment: Alignment.topCenter,
      );
    }
    return Container();
  }
}
