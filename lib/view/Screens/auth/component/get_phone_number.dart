import 'package:customar_app/util/index_path.dart';

class GetPhoneNumber extends StatefulWidget {

  const GetPhoneNumber({Key? key}) : super(key: key);
  static String verify ="";

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  String? _verificationId;
  bool _isCodeSent = false;
  var phone = "";
  //var verify =""; 8511523122


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.06),
            child: Align(alignment: Alignment.topCenter,
              child: SvgPicture.asset(AppImages.BALLOON_BG,height: Get.height * 0.55,)),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Auth.WElCOME,
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_LARGE,
                ),
                Text(
                  Auth.AN_INCREDIBLE,
                  style: TextStyle(
                    fontFamily: 'Gilroy-Regular',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                Expanded(
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        borderSide: BorderSide.none,),
                    ),
                    initialCountryCode: 'IN',
                    showCountryFlag: false,
                    dropdownTextStyle: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                    style: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                    onChanged: (value) {
                      PhoneNumber phoneNumber = value;
                      String formattedPhoneNumber = '${phoneNumber.completeNumber}';
                      phone = formattedPhoneNumber;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimensions.BUTTON_HEIGHT,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                    //   String phoneNumber = phone;
                    // if (phoneNumber.isNotEmpty) {
                    //   // Call the verifyPhoneNumber function to start the verification process.
                    //   await verifyPhoneNumber(phoneNumber);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Text('Please enter a phone number.'),
                    //   ));
                    // }},
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: phone,
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          GetPhoneNumber.verify = verificationId;
                          print("get verify ${GetPhoneNumber.verify}");
                          Get.to(OTPScreen(verificationID: verificationId,));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      // Get.to(Login());
                      // otpController();
                    },
                    child: Text(
                      Auth.PRIMARY_BUTTON,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I agree with the",
                      style: TextStyle(
                          fontFamily: 'Gilroy-Regular',
                          color: kPrimaryColor,
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CreateAcc()),
                        // );
                      },
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kSelectColor,
                        ),
                      ),
                    ),
                    Text(
                      "and",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        color: kPrimaryColor,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CreateAcc()),
                        // );
                      },
                      child: Text(
                        "Privacy",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: kSelectColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // Future<void> verifyPhoneNumber(String phoneNumber) async {
  //   verificationCompleted(AuthCredential phoneAuthCredential) {}
  //
  //   verificationFailed(FirebaseAuthException authException) {
  //     print(
  //         'Phone number verification failed. Code: ${authException
  //             .code}. Message: ${authException.message}');
  //   }
  //
  //   codeSent(String verificationId, [int? forceResendingToken]) async {
  //     print('Verification code sent to $phoneNumber.');
  //     Get.to(OTPScreen());
  //     setState(() {
  //       _verificationId = verificationId;
  //       _isCodeSent = true;
  //     });
  //   }
  //
  //   codeAutoRetrievalTimeout(
  //       String verificationId) {
  //     print(
  //         'Verification code auto-retrieval timed out. Verification ID: $verificationId');
  //   }
  //
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //         phoneNumber: phoneNumber,
  //         verificationCompleted: verificationCompleted,
  //         verificationFailed: verificationFailed,
  //         codeSent: codeSent,
  //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //         timeout: Duration(seconds: 60));
  //   } catch (e) {
  //     print('Phone number verification failed. Exception: $e');
  //   }
  // }

}
