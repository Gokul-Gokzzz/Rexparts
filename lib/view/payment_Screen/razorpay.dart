import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rexparts/view/home/home.dart';

class PaymentScreen extends StatefulWidget {
  final double productAmount; // Add this line to accept product amount

  const PaymentScreen(
      {super.key, required this.productAmount}); // Modify constructor

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController amountController = TextEditingController();
  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController(
        text: widget.productAmount.toString()); // Set the product amount
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'Payment Success :${response.paymentId}',
      toastLength: Toast.LENGTH_SHORT,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Payment failed : ${response.message}',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: 'External Wallet : ${response.walletName}',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Do payment here',
                          style: TextStyle(fontSize: 21),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            controller: amountController,
                            decoration:
                                InputDecoration(hintText: 'Enter the amount'),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please Enter the amount";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!formkey.currentState!.validate()) {
                              return;
                            }
                            formkey.currentState!.save();
                            var options = {
                              "key": "rzp_test_CYrnTOG3W2cDCB",
                              "amount": num.parse(amountController.text) * 100,
                              "name": "Rexparts",
                              "description": "payment for our product",
                              "prefill": {
                                "contact": "8590314865",
                                "email": "rexparts@gmail.com",
                              },
                              "external": {
                                "wallet": ["paytm"]
                              },
                            };
                            try {
                              razorpay.open(options);
                            } catch (e) {
                              log(e.toString());
                            }
                          },
                          child: Text(
                            'Pay Now',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
