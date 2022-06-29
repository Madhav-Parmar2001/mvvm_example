import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class payment extends StatefulWidget {

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {

  TextEditingController _payment = TextEditingController();

  static const platform = const MethodChannel("razorpay_flutter");
   Razorpay _razorpay;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS: " + response.paymentId);
    //API

  }

  void _handlePaymentError(PaymentFailureResponse response) {
   print( "ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
   print("EXTERNAL_WALLET: " + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("payment"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: _payment,
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              var amt = _payment.text.toString();
              var options = {
                'key': 'rzp_test_YUhY7DLHdOzlty',
                'amount': double.parse(amt) * 100,
                'name': 'Membership Payment',
                'description': 'Gold',
                'retry': {'enabled': true, 'max_count': 1},
                'send_sms_hash': true,
                'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                'external': {
                  'wallets': ['paytm']
                }
              };

              try {
                _razorpay.open(options);
              } catch (e) {
                debugPrint('Error: e');
              }


            }, child: Text("Pay"))
          ],
        ),
      ),
    );
  }
}
