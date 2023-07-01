import 'package:carousel_slider/carousel_slider.dart';
import 'package:customar_app/util/image_const.dart';
import 'package:customar_app/util/index_path.dart';

class HomePageIn extends StatefulWidget {
  const HomePageIn({Key? key}) : super(key: key);

  @override
  State<HomePageIn> createState() => _HomePageInState();
}

class _HomePageInState extends State<HomePageIn> with WidgetsBindingObserver {
  GlobalKey widgetKey = GlobalKey();
  bool expanded = false;

  getWidgetPosition() {
    RenderBox? widgetBox =
        widgetKey.currentContext!.findRenderObject() as RenderBox?;
    Offset position = widgetBox!.localToGlobal(Offset.zero);
    print("widget position $position");
    setState(() {});
  }

  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getWidgetPosition();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomSheet: BottomSheetHome(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.BACK_ARR,
                      ))
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "4QF4+7H Las Vegas, Nevada, USA",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Regular',
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_DEFAULT,
                top: Dimensions.PADDING_SIZE_SMALL,
                bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                    colors: [Color(0xFF797979), Color(0xFF000000)],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  AppIcons.PROFILE,
                ),
                onPressed: () {
                  Get.to(AccountScreen());
                },
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hi, Laim",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    notifi_status("Technician_coming"),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Container(
                //padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                height: Get.height * 0.168,
                //width: Get.width * 1,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    //autoPlay: true,
                    //autoPlayInterval: Duration(seconds: 4),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: spareData.map((e) => spareBooking(e)).toList(),
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: spareData.map((e) {
                  int index = spareData.indexOf(e);
                  return Container(
                    margin: EdgeInsets.only(
                        right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    width: _currentIndex == index ? 15 : 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kSelectColor),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Spotlight",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Original Spare parts from our garage",
                        style: TextStyle(
                          fontFamily: 'Gilroy-SemiBold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: spotlistData.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: Get.width * .35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_LARGE,
                          ),
                          color: kSecondaryColor,
                        ),
                        child: Image.asset(
                          spotlistData[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.18),
            ],
          ),
          Align(
            key: widgetKey,
            alignment: Alignment.bottomCenter,
            child: BottomSheetHome(),
          ),
        ],
      ),
    );
  }

  Widget spareBooking(SpareData spareData) {
    return Container(
      //height: Get.height * .17,
      // width: Get.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.RADIUS_LARGE,
        ),
        color: kSecondaryColor,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
            child:  Image.asset(
              spareData.img,
              fit: BoxFit.cover,
            ),
          ),
          // Image.asset(
          //   spareData.img,
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.12, left: Get.width * 0.06),
            child: SizedBox(
              height: Dimensions.BUTTON_HEIGHT_SMALL,
              width: Get.width * .21,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Book now",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: kWhiteColor,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kSelectColor),
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
          ),
        ],
      ),
    );
  }

  notifi_status(String category) {
    switch (category) {
      case "Technician_coming":
        return Technician_coming();
      case "Technician_Arrived":
        return Technician_Arrived();
      case "Job_Done":
        return Job_Done();
      case "Repairing":
        return Repairing();
    }
  }
}

showAlertDialog(BuildContext context) {
  Widget chatButton = SizedBox(
    height: Dimensions.BUTTON_HEIGHT,
    width: Get.width * .3,
    child: ElevatedButton(
      onPressed: () {
        Get.to(ChatScreen());
      },
      child: Text(
        "Chat Us",
        style: TextStyle(
          fontFamily: 'Gilroy-Bold',
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: kPrimaryColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhiteColor,
        side: BorderSide(width: 1, color: kSelectColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
      ),
    ),
  );

  Widget callButton = SizedBox(
    height: Dimensions.BUTTON_HEIGHT,
    width: Get.width * .3,
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        "Call Us",
        style: TextStyle(
          fontFamily: 'Gilroy-Bold',
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          color: kWhiteColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kSelectColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
          ),
        ),
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: kBgLightColor,
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(Dimensions.RADIUS_EXTRA2_LARGE))),
    contentPadding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
    content: Container(
      height: Get.height * 0.13,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Need help?",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  child: SvgPicture.asset(
                    AppIcons.NOT_SYMBOL,
                    color: kSelectColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chatButton,
              SizedBox(
                width: Get.width * .03,
              ),
              callButton,
            ],
          ),
        ],
      ),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
