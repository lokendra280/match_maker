import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import '../../../../core/presentation/widget/forms/buttons.dart';
import '../../../../core/presentation/widget/toast.dart';

class LogOutDialog extends StatelessWidget {
  final Function logout;

  const LogOutDialog(this.logout, {Key? key}) : super(key: key);

  Future<void> _onLogOutSuccess(BuildContext context) async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please upgrade into premium Feature',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onPressed: () {
                KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                        amount: 10000,
                        productIdentity: "product id",
                        productName: "Match-Maker"),
                    preferences: [
                      PaymentPreference.khalti,
                    ],
                    onSuccess: (PaymentSuccessModel sucessmodel) {
                      CustomToast.showSuccessToast("Payment Sucessfull");

                    },
                    onFailure: (PaymentFailureModel failure) {
                      CustomToast.showErrorToast(failure.toString());
                    });
              },
              title: 'Pay With Khalti',
              width: 150,
              radius: 25,
              height: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'Cancel',
              width: 150,
              textColor: Theme.of(context).primaryColor,
              color: Colors.white,
              radius: 25,
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
