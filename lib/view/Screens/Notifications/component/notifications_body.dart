import 'package:customar_app/util/index_path.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
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
              "Notification",
              style: TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        child: Column(
          children: [
            Technician_coming(),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
            Technician_Arrived(),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
            Job_Done(),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
            Repairing(),
          ],
        ),
      ),
    );
  }
}

class Technician_coming extends StatelessWidget {
  const Technician_coming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE,
          vertical: Dimensions.PADDING_SIZE_SMALL),
      width: double.infinity,
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
          color: kSuccessBGC),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technician On the way!",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                Row(
                  children: [
                    Text(
                      "12 mints away",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kOrangeC,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "ServiceID#00001",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.BUTTON_HEIGHT,
            width: Get.width * .29,
            child: ElevatedButton(
              onPressed: () {
                Get.to(SOSTracking());
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.LOCATION_ARR,
                    color: kWhiteColor,
                  ),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  ),
                  Text(
                    "Track Now",
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(kOrangeC),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}

class Technician_Arrived extends StatelessWidget {
  const Technician_Arrived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE,
          vertical: Dimensions.PADDING_SIZE_SMALL),
      width: double.infinity,
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
          color: kSuccessBGC),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Technician Arrived!",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kWhiteColor,
                  ),
                ),
              ),
              Text(
                "ServiceID#00001",
                style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Finding the best solution \npossible for you",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Regular',
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    color: kWhiteColor,
                  ),
                ),
              ),
              Text(
                "03:57 pm",
                style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Job_Done extends StatelessWidget {
  const Job_Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE,
          vertical: Dimensions.PADDING_SIZE_SMALL),
      width: double.infinity,
      height: Get.height * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
          color: kSuccessBGC),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Done!",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                Text(
                  "We have provided our best service possible",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Regular',
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        color: kWhiteColor,
                      ),
                      children: [
                        TextSpan(
                          text: "\$000",
                          style: TextStyle(
                            fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          ),
                        ),
                        TextSpan(
                          text:
                          "your bill amount for the \nServiceID#00002",
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.BUTTON_HEIGHT,
            width: Get.width * .22,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>PaymentDetails());
              },
              child: Text(
                "\$ Get Bill",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kWhiteColor,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(kOrangeC),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}

class Repairing extends StatefulWidget {
  const Repairing({Key? key}) : super(key: key);

  @override
  State<Repairing> createState() => _RepairingState();
}

class _RepairingState extends State<Repairing> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE,
          vertical: Dimensions.PADDING_SIZE_SMALL),
      width: double.infinity,
      height: expanded != true ? Get.height * 0.11 : Get.height * 0.13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
          color: kSuccessBGC
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Repairing",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kWhiteColor,
                  ),
                ),
              ),
              Text(
                "12 mints away",
                style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kOrangeC,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "ServiceID#00001",
                style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Container(
                  height: 15,
                  width: 15,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOrangeC,
                  ),
                  child: expanded != true
                      ? SvgPicture.asset(
                    AppIcons.BACK_ARR,
                    color: kWhiteColor,
                  )
                      : RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      AppIcons.BACK_ARR,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          expanded != false
              ? Column(
            children: [
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Row(
                children: [
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Text(
                    "ID#00001",
                    style: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kOrangeC,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "ServiceID#00001",
                    style: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ],
          )
              : SizedBox(),
          SizedBox(
            height: Dimensions.PADDING_SIZE_SMALL,
          ),
          Row(
            children: [
              Container(
                width: Get.width * 0.5 + 2,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kWhiteColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: LinearPercentIndicator(
                  width: Get.width * 0.5,
                  lineHeight: 12.0,
                  percent: 0.6,
                  backgroundColor: Colors.transparent,
                  progressColor: kWhiteColor,
                  padding: EdgeInsets.zero,
                  barRadius: Radius.circular(10),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 40,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      color: kOrangeC
                  ),
                  child: SvgPicture.asset(
                    AppIcons.NOTIFI_CALL,
                    color: kWhiteColor,
                  ),
                ),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
              InkWell(
                onTap: () {
                  Get.to(ChatScreen());
                },
                child: Container(
                  height: 30,
                  width: 40,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                      color: kOrangeC
                  ),
                  child: SvgPicture.asset(
                    AppIcons.NOTIFI_CHAT,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


