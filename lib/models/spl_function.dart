import 'package:customar_app/util/index_path.dart';

splashNavigation() {
  Future.delayed(const Duration(milliseconds: 3000), () async {
    // Get.toNamed("/splash");
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      //Get.to(()=>HomePage());
    } else {
      // Get.to(() => LoginPage());
    }
  });
}

setUserLogin({required bool status}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", status);
}