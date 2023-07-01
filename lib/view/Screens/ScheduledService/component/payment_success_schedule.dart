import 'package:customar_app/util/image_const.dart';
import 'package:customar_app/util/index_path.dart';

class Payment_Success_Schedule extends StatelessWidget {
  const Payment_Success_Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSuccessBGC,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.PAY_SCC_BG),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: TicketWidget(
            width: 300,
            height: 550,
            isCornerRounded: true,
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: ScheduleTicketData(),
          ),
        ),
      ),
    );
  }
}

class ScheduleTicketData extends StatelessWidget {
  const ScheduleTicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.SUCCESS_TIC_BG),
        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
        ),
        MySeparator(color: Colors.grey),
        SizedBox(
          height: Dimensions.PADDING_SIZE_SMALL,
        ),
        Text(
          "Payment Success",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy-Bold',
            fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
            color: kPrimaryColor,
          ),
        ),
        Text(
          "Your payment has been successfully done",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy-Regular',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: kPrimaryColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "View Bill Details",
            style: TextStyle(
              fontFamily: 'Gilroy-Miduem',
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: kSelectColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Divider(color: kSelectLtColor),
        SizedBox(
          height: 10,
        ),
        Text(
          "Your Pickup Scheduled At",
          style: TextStyle(
            fontFamily: 'Gilroy-Miduem',
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        Text(
          "Wednesday 26 Jan, 10AM - 1PM",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy-Bold',
            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
            color: kSelectColor,
          ),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        SizedBox(
          height: Dimensions.BUTTON_HEIGHT,
          width: Get.width * .2,
          child: ElevatedButton(
            onPressed: () { },
            child: RotatedBox(quarterTurns: 2,child: SvgPicture.asset(AppImages.next_arr)),
            style: ElevatedButton.styleFrom(
              backgroundColor: kWhiteColor,
              side: BorderSide(width: 1, color: kSelectColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      Dimensions.RADIUS_EXTRA_LARGE)),
            ),
          ),
        ),
      ],
    );
  }
}

