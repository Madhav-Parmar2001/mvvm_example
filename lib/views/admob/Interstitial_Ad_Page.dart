// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Ad_Helper.dart';

class Interstitial_Ad_Page extends StatefulWidget {
  @override
  State<Interstitial_Ad_Page> createState() => Interstitial_Ad_PageState();
}

class Interstitial_Ad_PageState extends State<Interstitial_Ad_Page> {

  InterstitialAd _interstitialAd;
  int _interstitialLoadAttempts = 0;

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId:AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _createInterstitialAd();
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd.show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interstitial Ad"),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              child: Text("Interstitial Ad"),
              onPressed: (){
                _showInterstitialAd();
              },
            ),
          ),
        ],
      ),
    );
  }
}
