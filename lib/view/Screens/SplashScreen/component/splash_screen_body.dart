import 'package:customar_app/util/index_path.dart';

class SplashScreen_Body extends StatefulWidget {
  const SplashScreen_Body({Key? key}) : super(key: key);

  @override
  State<SplashScreen_Body> createState() => _SplashScreen_BodyState();
}

class _SplashScreen_BodyState extends State<SplashScreen_Body> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Get.to(OnboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Center(
        child: Image.asset(AppImages.logo,height: Get.height * 0.4,),
      ),
    );
  }
}
