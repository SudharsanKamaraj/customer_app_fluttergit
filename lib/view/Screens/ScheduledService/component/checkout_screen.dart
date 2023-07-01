import 'package:customar_app/util/index_path.dart';
import 'package:customar_app/util/image_const.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int taxPercentageValue = 10;
  int selectedDate = 0;
  int selectedTime = 0;

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
                  "Checkout",
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
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT),
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
                                    'Pickup Address',
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
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
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
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_SMALL),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kWhiteColor),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Select your Preferred Date & Time',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
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
                                    AppIcons.TIMER,
                                    color: kWhiteColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.CALENDER),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                'Pickup Date',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedDate = index;
                                  });
                                },
                                child: Container(
                                  height: Get.height * 0.075,
                                  width: Get.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: selectedDate == index ? kSelectLtColor : kWhiteColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.RADIUS_DEFAULT),
                                    border: Border.all(
                                      color: selectedDate == index ? kSelectColor : kSecondaryColor,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${DateFormat.MMMd().format(DateTime.now().add(Duration(days: index)))}",
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-Bold',
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Text(
                                        "${DateFormat.E().format(DateTime.now().add(Duration(days: index)))}",
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-Medium',
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: kPrimaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Divider(
                            color: kSelectLtColor,
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.TIME,
                                  color: kSelectColor),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                'Time Slot',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: Get.height * 0.05,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: time.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedTime = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.22,
                                      decoration: BoxDecoration(
                                        color: selectedTime == index ? kSelectLtColor : kWhiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: selectedTime == index ? kSelectColor : kSecondaryColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          time[index].time,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy-Bold',
                                            fontSize: Dimensions.FONT_SIZE_SMALL,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Divider(
                            color: kSelectLtColor,
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.SPANER, color: kSelectColor, height: 13,),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                'Pickup Scheduled',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Wednesday 26 Jan, 10AM - 1PM',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSelectColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Divider(
                            color: kSelectLtColor,
                          ),
                          Text(
                            '*A short text describing the required service. It helps the technician to understand the issue and prepare.',
                            style: TextStyle(
                              fontFamily: 'Gilroy-Regular',
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
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
                                "\$${getTaxAmount(taxPercentage: taxPercentageValue)}",
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
                                "View Bill Details",
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
                      width: Get.width * .37,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(Payment_Success_Schedule());
                        },
                        child: Text(
                          "Make Payment",
                          style: TextStyle(
                            fontFamily: 'Gilroy-Bold',
                            fontSize: Dimensions.FONT_SIZE_LARGE,
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

