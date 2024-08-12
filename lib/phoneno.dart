import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viva/otpscreen.dart';

class phoneNo extends StatefulWidget {
  const phoneNo({super.key});

  @override
  State<phoneNo> createState() => _phoneNoState();
}

class _phoneNoState extends State<phoneNo> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP TEST"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter your Phone No",
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              Fluttertoast.showToast(
                msg: "OTP getting",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red[300],
                textColor: Colors.white,
              );

              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: "+91" + phoneController.text.trim(),
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {
                  Fluttertoast.showToast(
                    msg: e.message ?? "Verification failed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red[300],
                    textColor: Colors.white,
                  );
                },
                codeSent: (String verificationId, int? resendToken) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTOScreen(verificationId: verificationId),
                    ),
                  );
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
            child: Text("Get OTP"),
          ),
        ],
      ),
    );
  }
}
