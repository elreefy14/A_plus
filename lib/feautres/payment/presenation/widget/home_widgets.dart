import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];
final Widget googlePayButton = Container(
    height: 48,
    width: 300,
    decoration: BoxDecoration(
      color: Color(0xFF4285F4),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(
        //   "assets/images/google_pay_logo.png",
        //   height: 24,
        //   width: 24,
        // ), use network image
        Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png",
          height: 24,
          width: 24,
        ),
        SizedBox(width: 8),
        Text(
          "Google Pay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ));

//make apple pay button
final Widget applePayButton = Container(
    height: 48,
    width: 300,
    decoration: BoxDecoration(
      color: Color(0xFF000000),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/apple_pay_logo.png",
          height: 24,
          width: 24,
        ),
        SizedBox(width: 8),
        Text(
          "Apple Pay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ));