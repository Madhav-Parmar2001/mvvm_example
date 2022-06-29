import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Ad_Helper.dart';

class Top_Banner_Page extends StatefulWidget {
  @override
  State<Top_Banner_Page> createState() => Top_Banner_PageState();
}

class Top_Banner_PageState extends State<Top_Banner_Page> {

  BannerAd _topbannerAd;
  bool _istopBannerAdReady = false;
  loadtopbanner()
  {
    _topbannerAd = BannerAd(

      adUnitId: AdHelper.topbannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _istopBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _istopBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _topbannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadtopbanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Banner"),
      ),
      body: Column(
        children: [
          // bottom
          if (_istopBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _topbannerAd.size.width.toDouble(),
                height: _topbannerAd.size.height.toDouble(),
                child: AdWidget(ad: _topbannerAd),
              ),
            ),
          Center(
            child: RaisedButton(
              child: Text(" Top Banner Ad"),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
