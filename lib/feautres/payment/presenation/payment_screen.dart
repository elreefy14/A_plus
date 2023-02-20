import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayScreen extends StatefulWidget {
  const GooglePayScreen({Key? key}) : super(key: key);

  @override
  State<GooglePayScreen> createState() => _GooglePayScreenState();
}

class _GooglePayScreenState extends State<GooglePayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pay'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GooglePayButton(
                paymentConfigurationAsset: JsonAssets.gpayAsset,
                paymentItems: paymentItems,
                onPaymentResult: onGooglePayResult,
                // style: GooglePayButtonStyle.white,
                margin: const EdgeInsets.only(top: 15.0),
                width: double.maxFinite,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PaymentItem> get paymentItems {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '1.00',
        status: PaymentItemStatus.final_price,
      ),
    ];

    return _paymentItems;
  }

  void onGooglePayResult(dynamic paymentResult) {
    debugPrint(paymentResult.toString());
  }
}

class JsonAssets {
  JsonAssets._();

  static const String gpayAsset =
      'gpay.json';
}