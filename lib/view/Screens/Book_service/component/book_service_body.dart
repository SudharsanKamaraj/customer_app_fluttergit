import 'dart:io';

import 'package:customar_app/util/index_path.dart';

List<ListItem> _item = <ListItem>[];

class ListItem {}

class BookServiceBody extends StatefulWidget {
  const BookServiceBody({Key? key}) : super(key: key);

  @override
  State<BookServiceBody> createState() => _BookServiceBodyState();
}

class _BookServiceBodyState extends State<BookServiceBody> {
  var controller = Get.put(CamerasController());

  String? valueChoose;
  List<XFile> photo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(100), color: kWhiteColor),
              child: RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset(
                    AppIcons.BACK_ARR,
                    color: kSelectColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Book Service",
              style: TextStyle(
                fontFamily: 'Gilroy-Bold',
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: Get.height * .2,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [kSelectColor, kWhiteColor],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * .13),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_DEFAULT),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.RADIUS_LARGE,
                        ),
                        color: kWhiteColor,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  child: Text(
                                    "Upload images",
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Bold',
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
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
                                      AppIcons.CAMERA,
                                      color: kWhiteColor,
                                    ),
                                    onPressed: () {
                                      controller.takePicture().then((value) {
                                        Get.bottomSheet(CapturedImage(
                                          picture: photo,
                                        ));
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
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
                                    AppIcons.UPLOAD,
                                    color: kWhiteColor,
                                  ),
                                  onPressed: () {
                                    controller.gallery().then((value) {
                                      Get.bottomSheet(CapturedImage(
                                        picture: photo,
                                      ));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.04),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        AppImages.TRAKLOGO,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.RADIUS_LARGE,
                  ),
                  color: kWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Customer Details",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Customer Name",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Medium',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    SizedBox(
                      height: Dimensions.MESSAGE_INPUT_HEIGHT,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kBgLightColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_LARGE),
                              borderSide: BorderSide.none),
                          hintText: "Type the name",
                          hintStyle: TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: kHintText,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Model",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            SizedBox(
                              width: Get.width * .38,
                              height: Dimensions.MESSAGE_INPUT_HEIGHT,
                              child: DropdownButtonFormField(
                                icon: SvgPicture.asset(AppIcons.BACK_ARR),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kBgLightColor,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.RADIUS_LARGE),
                                      borderSide: BorderSide.none),
                                ),
                                hint: Text(
                                  "Select Model",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy-Medium',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kHintText,
                                      fontStyle: FontStyle.italic),
                                ),
                                value: valueChoose,
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    child: Text(valueItem),
                                    value: valueItem,
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue as String?;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Number",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            SizedBox(
                              width: Get.width * .38,
                              height: Dimensions.MESSAGE_INPUT_HEIGHT,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kBgLightColor,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.RADIUS_LARGE),
                                      borderSide: BorderSide.none),
                                  hintText: "Type number",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Gilroy-Medium',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kHintText,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Location",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Medium',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    SizedBox(
                      height: Dimensions.MESSAGE_INPUT_HEIGHT,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            margin: EdgeInsets.all(15.0),
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
                          filled: true,
                          fillColor: kBgLightColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_LARGE),
                              borderSide: BorderSide.none),
                          hintText: "Locate",
                          hintStyle: TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            color: kHintText,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                height: Get.height * .14,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.RADIUS_LARGE,
                  ),
                  color: kWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Service Request",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Dimensions.BUTTON_HEIGHT,
                          width: Get.width * .38,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(SOS_Service());
                            },
                            child: Text(
                              "SOS Service",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kWhiteColor,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                        SizedBox(
                          height: Dimensions.BUTTON_HEIGHT,
                          width: Get.width * .39,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(ScheduledScreen());
                            },
                            child: Text(
                              "Scheduled Service",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kSelectColor,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kWhiteColor),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CapturedImage({required List<XFile> picture}) {
    late XFile _image;
    var picIndex = 0.obs;

    var controller = Get.put(CamerasController());

    Future deleteImage(int index) async {
      try {
        if (controller.photo.length == 1) {
          controller.photo.removeAt(index);
          Get.back();
        } else {
          controller.photo.removeAt(index);
        }
      } catch (e) {
        print(e.toString());
      }
    }

    int selectedImage = 0;
    Color selectedBorderColor = Colors.blue;

    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      maxChildSize: 0.95,
      builder: (BuildContext context, ScrollController scrollController) {
        return Wrap(
          children: [
            Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                decoration: BoxDecoration(
                    color: kBgLightColor,
                    borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(Dimensions.RADIUS_EXTRA_LARGE),
                        topLeft:
                            Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
                    boxShadow: [
                      BoxShadow(
                        color: kHintText,
                        blurRadius: 30.0,
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Captured",
                          style: TextStyle(
                            fontFamily: 'Gilroy-Bold',
                            fontSize: Dimensions.FONT_SIZE_LARGE,
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
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Obx(
                      () => controller.photo.isNotEmpty
                          ? Container(
                              height: Get.height * .25,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_LARGE,
                                ),
                                color: kSecondaryColor,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                                child: controller.photo.length > picIndex.value
                                    ? Image.file(
                                  File(controller.photo[picIndex.value].path),
                                  fit: BoxFit.cover,
                                )
                                    : Container(),
                              ),)
                          : SizedBox(),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(
                                () => ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.photo.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          picIndex.value = index;
                                          print(picIndex);
                                        });
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                                          border: Border.all(
                                            color: picIndex.value == index ? kSelectColor : kSecondaryColor,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Stack(children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT)),
                                              foregroundDecoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black,
                                                    Colors.transparent,
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: [0, 0.5],
                                                ),
                                              ),
                                              child: Image.file(
                                                File(controller.photo[index].path),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                                top: 10,
                                                right: 10,
                                                child: InkWell(
                                                  onTap: () => deleteImage(index),
                                                  child: SvgPicture.asset(AppIcons.DELETE),
                                                )),
                                          ]),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              // () => ListView.builder(
                              //   itemCount: controller.photo.length,
                              //   scrollDirection: Axis.horizontal,
                              //   itemBuilder: (BuildContext context, int index) {
                              //     return InkWell(
                              //       onTap: () {
                              //         setState(() {
                              //           picIndex.value = index;
                              //           print(picIndex);
                              //         });
                              //       },
                              //       child: Container(
                              //         height: 80,
                              //         width: 80,
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(
                              //               Dimensions.RADIUS_DEFAULT),
                              //           border: Border.all(
                              //             color: controller.photo[picIndex.value].path == index ? kSelectColor : kSecondaryColor,
                              //           ),
                              //         ),
                              //         margin: EdgeInsets.only(
                              //             right: Dimensions.PADDING_SIZE_SMALL),
                              //         child: ClipRRect(
                              //           borderRadius:
                              //               BorderRadius.circular(10.0),
                              //           child: Stack(children: [
                              //             Container(
                              //               height: 80,
                              //               width: 80,
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(
                              //                           Dimensions
                              //                               .RADIUS_DEFAULT)),
                              //               foregroundDecoration:
                              //                   const BoxDecoration(
                              //                 gradient: LinearGradient(
                              //                   colors: [
                              //                     Colors.black,
                              //                     Colors.transparent,
                              //                   ],
                              //                   begin: Alignment.topRight,
                              //                   end: Alignment.bottomLeft,
                              //                   stops: [0, 0.5],
                              //                 ),
                              //               ),
                              //               child: Image.file(
                              //                 File(
                              //                     controller.photo[index].path),
                              //                 fit: BoxFit.cover,
                              //               ),
                              //             ),
                              //             Positioned(
                              //                 top: 10,
                              //                 right: 10,
                              //                 child: InkWell(
                              //                   onTap: () => deleteImage(index),
                              //                   child: SvgPicture.asset(
                              //                       AppIcons.DELETE),
                              //                 )),
                              //           ]),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Container(
                            height: 50,
                            width: 50,
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
                                  AppIcons.GALLERY_ADD,
                                  color: kWhiteColor,
                                ),
                                onPressed: () {
                                  controller.gallery().then((value) {
                                    picture: photo;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    SizedBox(
                      height: Dimensions.BUTTON_HEIGHT,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child: Text(
                          "Upload",
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
                    ),
                  ],
                )),
          ],
        );
      },
    );
  }
}
