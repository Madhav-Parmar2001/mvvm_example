import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Ad_Helper.dart';

class Bottom_Banner_Page extends StatefulWidget {
  @override
  State<Bottom_Banner_Page> createState() => _Bottom_Banner_PageState();
}

class _Bottom_Banner_PageState extends State<Bottom_Banner_Page> {

  BannerAd _bottombannerAd;
  bool _isbottomBannerAdReady = false;
  loadbottombanner()
  {
    _bottombannerAd = BannerAd(

      adUnitId: AdHelper.bottombannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isbottomBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isbottomBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bottombannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadbottombanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Banner"),
      ),
      body: Column(
        children: [
          // bottom
          Center(
            child: RaisedButton(
              child: Text(" Bottom Banner Ad"),
              onPressed: (){},
            ),
          ),
          if (_isbottomBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _bottombannerAd.size.width.toDouble(),
                height: _bottombannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bottombannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
