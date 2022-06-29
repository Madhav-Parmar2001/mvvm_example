import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Ad_Helper.dart';

class Rewarded_Ad_Page extends StatefulWidget {
  @override
  State<Rewarded_Ad_Page> createState() => Rewarded_Ad_PageState();
}

class Rewarded_Ad_PageState extends State<Rewarded_Ad_Page> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createRewaredAd();
  }

  RewardedInterstitialAd _rewardedAd;

  void _createRewaredAd(){
    RewardedInterstitialAd.load(
        adUnitId: AdHelper.rewardedAdUnitId,
        request: AdRequest(),

        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            // Keep a reference to the ad so you can show it later.
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedAd = null;
            _createRewaredAd();
          },
        )
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (RewardedInterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
        },
        onAdImpression: (RewardedInterstitialAd ad) => print('$ad impression occurred.'),
      );
      _rewardedAd.show();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewarded Ad"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              child: Text("Rewarded Ad"),
              onPressed: (){
                _showRewardedAd();
              },
            ),
          )
        ],
      ),
    );
  }
}
