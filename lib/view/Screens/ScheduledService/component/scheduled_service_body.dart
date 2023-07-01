import 'package:customar_app/util/index_path.dart';
import 'package:customar_app/view/Screens/ScheduledService/component/cart_screen.dart';

class Scheduled_Service_Body extends StatefulWidget {
  const Scheduled_Service_Body({Key? key}) : super(key: key);

  @override
  State<Scheduled_Service_Body> createState() => _Scheduled_Service_BodyState();
}

class _Scheduled_Service_BodyState extends State<Scheduled_Service_Body> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {});
    });
  }

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
                "Scheduled Service Booking",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              child: SizedBox(
                height: Dimensions.BUTTON_HEIGHT,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      child: SvgPicture.asset(
                        AppIcons.SEARCH,
                      ),
                    ),
                    filled: true,
                    fillColor: kWhiteColor,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        borderSide: BorderSide.none),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: ScheduledExpandableCard()),
          ],
        ));
  }
}

class ScheduledExpandableCard extends StatefulWidget {
  const ScheduledExpandableCard({Key? key}) : super(key: key);

  @override
  _ScheduledExpandableCardState createState() =>
      _ScheduledExpandableCardState();
}

class _ScheduledExpandableCardState extends State<ScheduledExpandableCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT,
            right: Dimensions.PADDING_SIZE_DEFAULT,
            top: Dimensions.PADDING_SIZE_LARGE,
            bottom: 65,
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: scheduldData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: Dimensions.PADDING_SIZE_SMALL,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      scheduldData[index].expanded =
                          !scheduldData[index].expanded;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_SMALL),
                    width: double.infinity,
                    height: scheduldData[index].expanded != true
                        ? Get.height * 0.1
                        : Get.height * 0.26,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        color: kWhiteColor),
                    child: scheduldData[index].expanded != true
                        ? Row(
                            children: [
                              Expanded(
                                child: Text(
                                  scheduldData[index].headerItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Meduim',
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: kPrimaryColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '\$${scheduldData[index].price}\n',
                                        style: TextStyle(color: kSelectColor)),
                                    TextSpan(
                                      text: '25% off ',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                    TextSpan(
                                      text: '\$00 ',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              SizedBox(
                                height: Dimensions.BUTTON_HEIGHT,
                                width: Get.width * .19,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (selectedScheduldData
                                          .contains(scheduldData[index])) {
                                        Get.snackbar("Oops!", "Already Added");
                                      } else {
                                        selectedScheduldData
                                            .add(scheduldData[index]);
                                      }
                                    });
                                    print("selecetd: ${selectedScheduldData}");
                                  },
                                  child: Text(
                                    "+Add",
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Bold',
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            kSelectColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.RADIUS_LARGE),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.PADDING_SIZE_SMALL),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            scheduldData[index].headerItem,
                                            style: TextStyle(
                                              fontFamily: 'Gilroy-Bold',
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kSelectLtColor),
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              Text(
                                                scheduldData[index].miles,
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy-Meduim',
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kSelectLtColor),
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              Text(
                                                scheduldData[index].time,
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy-Meduim',
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kSelectLtColor),
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              Text(
                                                scheduldData[index].warranty,
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy-Meduim',
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kSelectLtColor),
                                              ),
                                              SizedBox(
                                                width: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              Text(
                                                scheduldData[index].services,
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy-Meduim',
                                                  fontSize: Dimensions
                                                      .FONT_SIZE_EXTRA_SMALL,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Dimensions.PADDING_SIZE_LARGE,
                                          ),
                                          RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'Gilroy-Meduim',
                                                fontSize:
                                                    Dimensions.FONT_SIZE_SMALL,
                                                color: kPrimaryColor,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\$${scheduldData[index].price}\n',
                                                    style: TextStyle(
                                                        color: kSelectColor)),
                                                TextSpan(
                                                  text: '\$00',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                                TextSpan(
                                                  text: ' 25% off',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Get.width * .27,
                                      height: Get.height * 0.13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.RADIUS_LARGE),
                                        color: kSecondaryColor,
                                      ),
                                      child: Image.asset(
                                        AppImages.SCHED_SAPLE,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.PADDING_SIZE_SMALL,
                                    ),
                                    SizedBox(
                                      height: Dimensions.BUTTON_HEIGHT,
                                      width: Get.width * .27,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (selectedScheduldData.contains(
                                                scheduldData[index])) {
                                              Get.snackbar(
                                                  "Oops!", "Already Added");
                                            } else {
                                              selectedScheduldData
                                                  .add(scheduldData[index]);
                                            }
                                          });
                                          print(
                                              "selecetd: ${selectedScheduldData}");
                                        },
                                        child: Text(
                                          "+Add",
                                          style: TextStyle(
                                            fontFamily: 'Gilroy-Bold',
                                            fontSize:
                                                Dimensions.FONT_SIZE_LARGE,
                                            color: kSelectColor,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kSelectLtColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.RADIUS_LARGE)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
        selectedScheduldData.isNotEmpty ? Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: Get.height * 0.07,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedScheduldData;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer(
                              builder: (context, value, child) {
                                print("add: ${selectedScheduldData.length.toString()}");
                                return Text(
                                  selectedScheduldData.length.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Medium',
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                    color: kWhiteColor,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            Text(
                              totalAmount(),
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "View Cart",
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kWhiteColor,
                    ),
                  ),
                ]),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kSelectColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
            : SizedBox(),
      ],
    );
  }
}
