import 'package:customar_app/util/index_path.dart';

class SOS_Service_Booking extends StatefulWidget {
  final SOSItemModel detail;
  const SOS_Service_Booking({Key? key, required this.detail}) : super(key: key);

  @override
  State<SOS_Service_Booking> createState() => _SOS_Service_BookingState();
}

class _SOS_Service_BookingState extends State<SOS_Service_Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgLightColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kWhiteColor),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: SvgPicture.asset(
                              AppIcons.BACK_ARR,
                              color: kSelectColor,
                            )))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "SOS Service Booking",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_SMALL),
                      width: double.infinity,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kWhiteColor),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.detail.headerItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  widget.detail.subheaderItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Gilroy-Meduim',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSelectColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "\$${widget.detail.price}",
                                ),
                                TextSpan(
                                  text: '\nBasic Price',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy-Regular',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kPrimaryColor,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_SMALL),
                      width: double.infinity,
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kWhiteColor),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.PADDING_SIZE_SMALL,
                                ),
                                Text(
                                  '4QF4+7H Las Vegas, Nevada, USA',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Mudium',
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [kSelectColor, kWhiteColor],
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.bottomLeft,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                AppIcons.LOCATION_ARR,
                                color: kWhiteColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.PADDING_SIZE_SMALL),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kSelectLtColor),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Gilroy-Medium',
                                          fontSize: Dimensions.FONT_SIZE_LARGE,
                                          color: kPrimaryColor,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        hintText: "Add Service Description",
                                      )),
                                  // child: SizedBox(
                                  //   height: 70,
                                  //   child: TextField(
                                  //       // textAlignVertical: TextAlignVertical.top,
                                  //        maxLines: null,
                                  //        expands: true,
                                  //        keyboardType: TextInputType.multiline,
                                  //       decoration: InputDecoration(
                                  //         //filled: true,
                                  //         //fillColor: Colors.blue,
                                  //         border: OutlineInputBorder(
                                  //             borderSide: BorderSide.none),
                                  //         hintStyle: TextStyle(
                                  //           fontFamily: 'Gilroy-Medium',
                                  //           fontSize: Dimensions.FONT_SIZE_LARGE,
                                  //           color: kPrimaryColor,
                                  //         ),
                                  //         enabledBorder: InputBorder.none,
                                  //         hintText: "Add Service Description",
                                  //       )),
                                  // ),
                                ),
                                Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [kSelectColor, kWhiteColor],
                                        begin: FractionalOffset.topRight,
                                        end: FractionalOffset.bottomLeft,
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                      AppIcons.EDIT,
                                      color: kWhiteColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MySeparator(color: kSecondaryColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '*A short text describing the required service. It helps the technician to understand the issue and prepare.',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Medium',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  '500/500',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Medium',
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Get.height * 0.1,
                color: kWhiteColor,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.PADDING_SIZE_LARGE),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Advance Payment",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kSelectColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              ),
                              Text(
                                "This will be deducted from your final bill",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.BUTTON_HEIGHT,
                      width: Get.width * .27,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(SuccessScreen());
                        },
                        child: Text(
                          "Pay \$${widget.detail.price}",
                          style: TextStyle(
                            fontFamily: 'Gilroy-Bold',
                            fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            color: kWhiteColor,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kSelectColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_LARGE),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
