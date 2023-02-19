import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:youtube_apis/feautres/payment/presenation/widget/home_widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '1.00 ',
        status: PaymentItemStatus.final_price,
      )
    ];
    //make google pay button
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //if platform is android then show google pay button
            // googlePayButton,
            // SizedBox(height: 16),
            // applePayButton,
            // if (Platform.isAndroid) googlePayButton,
            // if (Platform.isIOS) applePayButton, use if else
            

            GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (data) {

                  print('Payment result: \n\n\n$data');
                  print(data);

                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
