import 'package:customar_app/util/index_path.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isValidForm = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> handleCreateUser() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    await createUser(firstName, lastName, email);
    // do something after successful login
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Form(
        key:_formKey ,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Let us remember you",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "First Name",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
            SizedBox(
              height: isValidForm ? Dimensions.MESSAGE_INPUT_HEIGHT : 80,
              child: TextFormField(
                  controller: firstNameController,
                validator: (inputValue){
                  if(inputValue!.isEmpty){
                    return "Please enter your first name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kWhiteColor,
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                  ),
                  // hintText: "login",
                  // hintStyle: TextStyle(
                  //   fontFamily: 'Gilroy-Reguler',
                  //   fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //   color: kHintText,
                  //     fontStyle: FontStyle.italic
                  // ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "List Name",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
            SizedBox(
              height: isValidForm ? Dimensions.MESSAGE_INPUT_HEIGHT : 80,
              child: TextFormField(
                controller: lastNameController,
                validator: (inputValue){
                  if(inputValue!.isEmpty){
                    return "Please enter your first last name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kWhiteColor,
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                  ),
                  // hintText: "login",
                  // hintStyle: TextStyle(
                  //   fontFamily: 'Gilroy-Reguler',
                  //   fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //   color: kHintText,
                  //     fontStyle: FontStyle.italic
                  // ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
            SizedBox(
              height: isValidForm ? Dimensions.MESSAGE_INPUT_HEIGHT : 80,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kWhiteColor,
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                  ),
                  // hintText: "password",
                  // hintStyle: TextStyle(
                  //     fontFamily: 'Gilroy-Reguler',
                  //     fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  //     color: kHintText,
                  //     fontStyle: FontStyle.italic
                  // ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address.';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Save the form field value to your model or database
                },
              ),
            ),
            SizedBox(
              height: size.height*0.33,
            ),
            SizedBox(
              height: Dimensions.BUTTON_HEIGHT,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  handleCreateUser();
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      isValidForm = true;
                    });
                  } else{
                    setState(() {
                      isValidForm = false;
                    });
                  }
                  //isValidForm ? Get.to(LocationPermission()) : null;
                },
                child: Text(
                  "Next",
                  style :TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: kWhiteColor,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>( kSelectColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
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

