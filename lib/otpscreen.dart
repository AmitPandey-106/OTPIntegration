import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viva/home.dart';

class OTOScreen extends StatefulWidget {
  final String verificationId;
  OTOScreen({super.key, required this.verificationId});

  @override
  State<OTOScreen> createState() => _OTOScreenState();
}

class _OTOScreenState extends State<OTOScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter the OTP",
                suffixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              String otp = otpController.text.trim();
              if (otp.isEmpty) {
                Fluttertoast.showToast(
                  msg: "Please enter the OTP",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red[300],
                  textColor: Colors.white,
                );
                return;
              }

              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: otp,
                );

                await FirebaseAuth.instance.signInWithCredential(credential);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } catch (e) {
                Fluttertoast.showToast(
                  msg: "Verification failed. Please try again.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red[300],
                  textColor: Colors.white,
                );
              }
            },
            child: Text("Verify"),
          ),
        ],
      ),
    );
  }
}
