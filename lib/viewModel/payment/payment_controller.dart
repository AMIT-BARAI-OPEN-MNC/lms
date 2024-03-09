import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lms/viewModel/payment/payment_confrigration.dart';
import 'package:pay/pay.dart';

class PaymentController extends ChangeNotifier {
  Future<PayButton> paymentButton(double amount, String itemName) async {
    var applePayButton = ApplePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultApplePay),
      paymentItems: [
        PaymentItem(
          label: '$itemName',
          amount: '$amount',
          status: PaymentItemStatus.final_price,
        ),
      ],
      style: ApplePayButtonStyle.black,
      width: double.infinity,
      height: 50,
      type: ApplePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint('Payment Result $result'),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var googlePayButton = GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: [
        PaymentItem(
          label: '$itemName',
          amount: '$amount',
          status: PaymentItemStatus.final_price,
        )
      ],
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint('Payment Result $result'),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (Platform.isIOS) {
      return applePayButton;
    } else {
      return googlePayButton;
    }
  }

  //===================================================================
}
