import 'package:customar_app/util/index_path.dart';

class HomePageOut extends StatefulWidget {
  const HomePageOut({Key? key}) : super(key: key);

  @override
  State<HomePageOut> createState() => _HomePageOutState();
}

class _HomePageOutState extends State<HomePageOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding:
              const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Text(
            "Don’t you have an account",
            style: TextStyle(
              fontFamily: 'Gilroy-Regular',
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: kPrimaryColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_LARGE,
                top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: SizedBox(
              height: Dimensions.BUTTON_HEIGHT,
              width: Get.width * .31,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: kWhiteColor,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
      body: Stack(children: [
        ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              height: Get.height * .2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: spareData.map((e) => spareBooking(e)).toList(),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  height: Dimensions.PADDING_SIZE_SMALL,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kSelectColor
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  height: Dimensions.PADDING_SIZE_SMALL,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kSelectColor
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  height: Dimensions.PADDING_SIZE_SMALL,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kSelectColor
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
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
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
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
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: spotlistData.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
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
            SizedBox(height: Get.height * 0.22),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
            child: BottomSheetHome(),
        )
      ]),
    );
  }

  Widget spareBooking(SpareData spareData) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
      child: Container(
        height: Get.height * .2,
        width: Get.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.RADIUS_LARGE,
          ),
          color: kSecondaryColor,
        ),
        child: Stack(
          children: [
            Image.asset(
              spareData.img,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.13,left: Get.height * 0.035),
              child: SizedBox(
                height: Dimensions.BUTTON_HEIGHT_SMALL,
                width: Get.width * .2,
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
                    MaterialStateProperty.all<Color>( kSelectColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }
}
