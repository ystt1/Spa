import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Screens/home_screen.dart';
import 'package:tbdd/UI/Widgets/ButtonWidget.dart';

class VerificationScreen extends StatefulWidget {
  final String verificationID;
  VerificationScreen({super.key, required this.verificationID});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _otpController = TextEditingController();

  Future<void> _submitOTP(BuildContext context) async {
    String otp = _otpController.text.trim();
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      context.goNamed('home');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verification')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode) {
                _otpController.text = verificationCode;
              }, // end onSubmit
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ButtonWidget(
                    text: "xác thực", ontap: () => _submitOTP(context)))
          ]),
        ),
      ),
    );
  }
}
