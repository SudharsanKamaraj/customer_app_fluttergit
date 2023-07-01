import 'package:customar_app/util/image_const.dart';
import 'package:customar_app/util/index_path.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSuccessBGC,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
            vertical: Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: Get.height * 0.23,
                child: Image.asset(AppImages.SUCCESS_TIC),
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_SMALL,
            ),
            Text(
              "Booking\nHas Confirmed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "Our technician is on the way",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy-regular',
                fontSize: Dimensions.FONT_SIZE_LARGE,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            SizedBox(
              height: Dimensions.BUTTON_HEIGHT,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(SOSTracking());
                },
                child: Text(
                  "Track Now",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: kSelectColor,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kSelectLtColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_LARGE),
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
