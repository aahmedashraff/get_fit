import 'package:flutter/material.dart';

import '../../sizeConfig.dart';
import '../../theme/theme_constant.dart';

enum PaymentSelect {
  visa,
  paypal,
  vcash,
  fawry,
}

class BuyProgramScreen extends StatefulWidget {
  const BuyProgramScreen({Key key}) : super(key: key);
  static const screenName = "/buyprog-screen";

  @override
  State<BuyProgramScreen> createState() => _BuyProgramScreenState();
}

class _BuyProgramScreenState extends State<BuyProgramScreen> {
  PaymentSelect SelectedPayment;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical * 1),
            Text(
              'Buy Program',
              style: TextStyle(fontSize: 20),
            ),
            isDark
                ? Image.asset('assets/images/buy.png')
                : Image.asset('assets/images/buylight.png'),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Payment Methods',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Column(
              children: [
                //visa
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          SelectedPayment = PaymentSelect.visa;
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: SelectedPayment == PaymentSelect.visa
                              ? primaryColor
                              : Colors.grey.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Text('Credit Card'),
                            Spacer(),
                            Image.asset('assets/images/visa.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                //paypal
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          SelectedPayment = PaymentSelect.paypal;
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: SelectedPayment == PaymentSelect.paypal
                              ? primaryColor
                              : Colors.grey.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Text('Paypal'),
                            Spacer(),
                            Image.asset('assets/images/paypal.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                //vodafonecash
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          SelectedPayment = PaymentSelect.vcash;
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: SelectedPayment == PaymentSelect.vcash
                              ? primaryColor
                              : Colors.grey.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Text('Vodafone Cash'),
                            Spacer(),
                            Image.asset('assets/images/vcash.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                //Fawry
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          SelectedPayment = PaymentSelect.fawry;
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isDark ? Colors.grey.shade900 : Colors.grey.shade50,
                        border: Border.all(
                          color: SelectedPayment == PaymentSelect.fawry
                              ? primaryColor
                              : Colors.grey.shade900,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Text('Fawry'),
                            Spacer(),
                            Image.asset('assets/images/fawry.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
