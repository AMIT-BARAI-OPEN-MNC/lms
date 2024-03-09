import 'package:flutter/material.dart';
import 'package:lms/uttils/font_style.dart';
import 'package:lms/viewModel/payment/payment_controller.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
          Consumer<PaymentController>(builder: (context, paymentController, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Account",
                style: Fontstyle.getHeading(screenWidth),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: FutureBuilder<PayButton>(
                future: paymentController.paymentButton(12.2, "item pant"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Center(child: snapshot.data);
                  }
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
