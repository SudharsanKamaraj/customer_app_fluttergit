import 'package:customar_app/util/index_path.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;
//
// void inputData() {
//   final User? user = auth.currentUser;
//   final uid = user!.uid;
//   print("this is uid ${uid}");
//   // here you write the codes to input the data into firestore
// }


class OTPScreen extends StatefulWidget {
  final String verificationID ;
  //final String phone;

  const OTPScreen({Key? key, required this.verificationID , }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
   final FirebaseAuth auth = FirebaseAuth.instance;
   String? _verificationId;
   var code = "";
  //  final phoneNumberController = widget.phone;
  //  final uidController = inputData();
  //
  //  Future<void> otpPhoneNumber() async {
  //    final phoneNumber = firstNameController.text;
  //    final uid = lastNameController.text;
  //    await postOtpPhoNum(phoneNumber,uid);
  //    // do something after successful login
  //  }
  //
  //  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
        fontFamily: 'Gilroy-Bold',
        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
        color: kPrimaryColor,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: kSelectLtColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: kSelectColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: kBgLightColor,
      ),
    );

    // var code = "";

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



    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBgLightColor,
      body: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Phone Verification",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                    onChanged: (pin) {
                      setState(() {
                        code = pin;
                      });
                      print("this is code ${code}");
                      //print("this is phonenumber ${widget.phone}");
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: Dimensions.BUTTON_HEIGHT,
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: (){},
                // onPressed: () async {
                //   String smsCode = code;
                //   print("sms code ${smsCode}");
                //   if (smsCode.isNotEmpty) {
                //     // Call the signInWithPhoneNumber function to complete authentication.
                //     await signInWithPhoneNumber(_verificationId!, smsCode);
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       content: Text('Please enter the verification code.'),
                //     ));
                //   }
                //   //Get.to(LocationPermission());
                // },
                onPressed: () async {
                  print("get verify ${GetPhoneNumber.verify}");
                  try{
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationID, smsCode: code);
                    await auth.signInWithCredential(credential).then((value) {
                      Get.to(Login());
                    });
                    //inputData();
                  }catch(e){
                    print("wrong otp ${e.toString()}");
                  }
                  // Get.to(Login());
                  // otpController();
                },
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: kWhiteColor,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(kSelectColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_LARGE),
                    ),
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'phone',
                  (route) => false,
                );
              },
              child: Text(
                "Edit Phone Number ?",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kSelectColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
