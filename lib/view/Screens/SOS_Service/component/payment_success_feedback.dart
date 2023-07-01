import 'package:customar_app/util/index_path.dart';

class Payment_Success_feedback extends StatelessWidget {
  const Payment_Success_feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSuccessBGC,
      body: Center(
        child: SingleChildScrollView(
          child: TicketWidget(
            width: Get.width * 0.8,
            height: Get.height * 0.75,
            isCornerRounded: true,
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: TicketData(),
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.SUCCESS_TIC_BG,height: Get.height * 0.22,),
        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
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
        MySeparator(color: kSecondaryColor),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        Text(
          "Rate Your Experience",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy-Bold',
            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        Text(
          "Are you Satisfied with service?",
          style: TextStyle(
            fontFamily: 'Gilroy-Miduem',
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        RatingBar.builder(
          itemSize: 25,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: kSelectColor,
            size: 20,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        SizedBox(
          height: 100,
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              filled: true,
              fillColor: kBgLightColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                  borderSide: BorderSide.none),
              hintText: "Feedback",
              hintStyle: TextStyle(
                  fontFamily: 'Gilroy-Mideum',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kHintText,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        SizedBox(
          height: Dimensions.BUTTON_HEIGHT,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){

            },
            child: Text(
              "Submit",
              style :TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
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
    );
  }
}
