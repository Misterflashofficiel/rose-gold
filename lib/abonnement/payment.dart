import 'dart:async';
import 'dart:math';
import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => new _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  TextEditingController amountController = new TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  bool show = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CinetPay Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("CinetPay Demo"),
            centerTitle: true,
          ),
          body: SafeArea(
              child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          show ? Icon(icon, color: color, size: 150) : Container(),
                          show ? SizedBox(height: 50.0) : Container(),
                          Text(
                            "Example integration Package for Flutter",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            "Cart informations.",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 50.0),
                          new Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            margin: EdgeInsets.symmetric(horizontal: 50.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: Colors.green),
                            ),
                            child: new TextField(
                              controller: amountController,
                              decoration: InputDecoration(
                                hintText: "Amount",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          ElevatedButton(
                            child: Text("Pay with CinetPay"),
                            onPressed: () async {
                              amountController.clear();

                              final String transactionId = Random().nextInt(100000000).toString(); // Mettre en place un endpoint à contacter cêté serveur pour générer des ID unique dans votre BD

                              await Get.to(CinetPayCheckout(
                                  title: 'Guichet de paiement',
                                  configData: <String, dynamic> {
                                    'apikey': '100394836062657a331a6412.82435851',
                                    'site_id': "976374",
                                    'notify_url': 'https://mondomaine.com/notify/'
                                  },
                                  paymentData: <String, dynamic> {
                                    'transaction_id': transactionId,
                                    'amount': 100,
                                    'currency': 'XOF',
                                    'channels': 'ALL',
                                    'description': 'Test de paiement'
                                  },
                                  waitResponse: (response) {
                                    print(response);
                                  }
                              ));
                            },
                          )
                        ],
                      ),
                    ],
                  )
              )
          )
      ),
    );
  }
}