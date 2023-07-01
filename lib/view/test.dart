// import 'package:customar_app/util/index_path.dart';
//
// class LoginPage extends StatelessWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   Future<void> handleLogin() async {
//     final email = emailController.text;
//     final password = passwordController.text;
//     await login(email, password);
//     // do something after successful login
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Column(
//         children: [
//           TextField(controller: emailController, keyboardType: TextInputType.emailAddress),
//           TextField(controller: passwordController, obscureText: true),
//           ElevatedButton(onPressed: handleLogin, child: Text('Login')),
//         ],
//       ),
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class MyPushNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FCM Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter FCM Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _requestPermissionAndSetupFirebaseMessaging();
              print("something ${_requestPermissionAndSetupFirebaseMessaging}");
            },
            child: Text('Enable Push Notifications'),
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermissionAndSetupFirebaseMessaging() async {
    // Request permission to receive push notifications
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    // Get the device token
    String? token = await FirebaseMessaging.instance.getToken();
    print('Device token: $token');
  }
}

 */


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customar_app/util/index_path.dart';

class PhoneNumberVerificationScreen extends StatefulWidget {
  @override
  _PhoneNumberVerificationScreenState createState() =>
      _PhoneNumberVerificationScreenState();
}

class _PhoneNumberVerificationScreenState
    extends State<PhoneNumberVerificationScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _smsCodeController = TextEditingController();
  String? _verificationId;
  bool _isCodeSent = false;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Future<void> signInWithPhoneNumber(String verificationId, String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        // User is signed in.
        print('User ${user.uid} is signed in.');
      } else {
        // Error occurred during sign in.
        print('Error occurred during sign in.');
      }
    } catch (e) {
      print('Error occurred during sign in. Exception: $e');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = _phoneNumberController.text.trim();
                if (phoneNumber.isNotEmpty) {
                  // Call the verifyPhoneNumber function to start the verification process.
                  await verifyPhoneNumber(phoneNumber);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a phone number.'),
                  ));
                }
              },
              child: Text('Send Verification Code'),
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: _isCodeSent,
              child: Column(
                children: [
                  Text(
                    'Enter the verification code sent to ${_phoneNumberController
                        .text}:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _smsCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      hintText: '887308',
                      counterText: '',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      String smsCode = _smsCodeController.text.trim();
                      if (smsCode.isNotEmpty) {
                        // Call the signInWithPhoneNumber function to complete authentication.
                        await signInWithPhoneNumber(_verificationId!, smsCode);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please enter the verification code.'),
                        ));
                      }
                      //Get.to(LocationPermission());
                    },
                    child: Text('Verify'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> verifyPhoneNumber(String phoneNumber) async {
    verificationCompleted(AuthCredential phoneAuthCredential) {
      // Callback function executed when verification is completed automatically
      // by the phone.
    }

    verificationFailed(FirebaseAuthException authException) {
      // Callback function executed when verification fails.
      print(
          'Phone number verification failed. Code: ${authException
              .code}. Message: ${authException.message}');
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      // Callback function executed when verification code is sent to the phone.
      print('Verification code sent to $phoneNumber.');
      // Store the verification ID somewhere to retrieve it later.
      setState(() {
        _verificationId = verificationId;
        _isCodeSent = true;
      });
    }

    codeAutoRetrievalTimeout(
        String verificationId) {
      // Callback function executed when the automatic code retrieval times out.
      // Here, you can store the verification ID somewhere to retrieve it later.
      print(
          'Verification code auto-retrieval timed out. Verification ID: $verificationId');
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          timeout: Duration(seconds: 60));
    } catch (e) {
      print('Phone number verification failed. Exception: $e');
    }
  }
}


