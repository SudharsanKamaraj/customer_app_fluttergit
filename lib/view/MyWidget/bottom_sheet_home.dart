import 'package:customar_app/util/index_path.dart';
import 'package:flutter/widgets.dart';

var isCollapsed = true.obs;

class BottomSheetHome extends StatefulWidget {
  const BottomSheetHome({Key? key}) : super(key: key);

  @override
  State<BottomSheetHome> createState() => _BottomSheetHomeState();
}

class _BottomSheetHomeState extends State<BottomSheetHome>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController.addListener(() {
      double position = _scrollController.offset;

      print(position);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (dragNotify) {
        print("${dragNotify.extent}");
        if (dragNotify.extent > 0.2) {
          isCollapsed.value = false;
        } else {
          isCollapsed.value = true;
        }
        setState(() {});
        return false;
      },
      child: DraggableScrollableSheet(
          initialChildSize: 0.185,
          minChildSize: 0.185,
          maxChildSize: 0.675,
          builder: (BuildContext context, ScrollController scrollController) {
            print(scrollController);
            return ListView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(Dimensions.RADIUS_EXTRA_LARGE),
                        topLeft:
                            Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: kShadow,
                    //     blurRadius: Dimensions.RADIUS_EXTRA_LARGE,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 8,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kSecondaryColor),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Visibility(
                        visible: !isCollapsed.value,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            Image.asset(AppImages.TRAK,height: Get.height * 0.25,),
                            SizedBox(
                              height: Get.height * .03,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Truck’s solution from the experts",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Regular',
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Visibility(
                        visible: !isCollapsed.value,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            Text(
                              "Book faster & better service in town!",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                                color: kPrimaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Get.height * .02,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: Dimensions.BUTTON_HEIGHT,
                            width: Get.width * .42,
                            child: ElevatedButton(
                              onPressed: () {
                                showAlertDialog(context);
                              },
                              child: Text(
                                "Need Help?",
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.RADIUS_LARGE)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.BUTTON_HEIGHT,
                            width: Get.width * .42,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(BookService());
                              },
                              child: Text(
                                "Book",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
