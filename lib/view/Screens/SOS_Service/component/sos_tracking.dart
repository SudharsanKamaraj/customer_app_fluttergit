import 'package:customar_app/util/index_path.dart';

class SOSTracking extends StatefulWidget {
  const SOSTracking({Key? key}) : super(key: key);

  @override
  State<SOSTracking> createState() =>
      _SOSTrackingState();
}

class _SOSTrackingState extends State<SOSTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding:
          const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
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
                width: Dimensions.PADDING_SIZE_SMALL,
              ),
              Text(
                "Tracking",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding:
            const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE,right: Dimensions.PADDING_SIZE_LARGE),
            child: Text(
              "12 mints away...",
              style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                fontSize: Dimensions.FONT_SIZE_LARGE,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraits) {
              return SizedBox(
                  height: constraits.maxHeight / 1, child: MapSample());
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              child: Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                height: Get.height * 0.11,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.RADIUS_LARGE,
                  ),
                  color: kWhiteColor ,
                ),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.RADIUS_LARGE,
                        ),
                        color: kShadow,
                      ),
                      child: Image.asset(AppImages.TRACKER,fit: BoxFit.fill,),
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Muhammad",
                            style: TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),
                          Text(
                            "Technician",
                            style: TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(AppIcons.CALL_RINGING,color: kSelectColor,),
                    SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

