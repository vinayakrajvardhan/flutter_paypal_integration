import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:url_launcher/url_launcher.dart';

class PayPalScreen extends StatefulWidget {
  const PayPalScreen({Key key}) : super(key: key);

  @override
  _PayPalScreenState createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Pay with Paypal"),
          onPressed: () async {
            var request = BraintreeDropInRequest(
              tokenizationKey: "token_key",
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: "10.00",
                displayName: "Vinayak Raj",
              ),
              cardEnabled: true,
            );
            BraintreeDropInResult result = await BraintreeDropIn.start(request);
            if (result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
          },
        ),
      ),
    );
  }
}
