import 'package:customar_app/util/index_path.dart';

class AccountScreenBody extends StatefulWidget {
  const AccountScreenBody({Key? key}) : super(key: key);

  @override
  State<AccountScreenBody> createState() => _AccountScreenBodyState();
}

class _AccountScreenBodyState extends State<AccountScreenBody> {
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
          child: Container(
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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: InkWell(
              child: Text(
                "Help",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
          child: Column(
            children: [
              Text(
                "Liam Noah",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Text(
                "+1 8524569501",
                style: TextStyle(
                  fontFamily: 'Gilroy-Medium',
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              SizedBox(
                height: Dimensions.BUTTON_HEIGHT,
                width: Get.width * .31,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.EDIT,color: kWhiteColor,),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Medium',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(kSelectColor),
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
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_SMALL),
                    width: double.infinity,
                    height: Get.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        color: kWhiteColor),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.SETTINGS,color: kSelectColor,),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Text(
                          'My Service',
                          style: TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              InkWell(
                onTap: (){
                  Get.to(NotificationBody());
                },
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_SMALL),
                    width: double.infinity,
                    height: Get.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        color: kWhiteColor),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.NOTIFICATION,color: kSelectColor,),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_SMALL),
                    width: double.infinity,
                    height: Get.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        color: kWhiteColor),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.ADDRESS,color: kSelectColor,),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        Text(
                          'Change Address',
                            style: TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                              color: kPrimaryColor,
                            ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Support Center',
                  style: TextStyle(
                    fontFamily: 'Gilroy-Regular',
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Container(
                  padding: EdgeInsets.all( Dimensions.PADDING_SIZE_LARGE,),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_LARGE),
                      color: kWhiteColor),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.MESSAGE,color: kSelectColor,),
                            SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            Text(
                              'View Messages',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_DEFAULT,
                      ),
                      MySeparator(color:kSelectLtColor),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_DEFAULT,
                      ),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.CALL,color: kSelectColor,),
                            SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            Text(
                              'Call Us',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_DEFAULT,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
