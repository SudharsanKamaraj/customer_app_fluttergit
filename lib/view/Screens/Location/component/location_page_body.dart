import 'package:customar_app/util/index_path.dart';

class LocationPageBody extends StatefulWidget {
  const LocationPageBody({Key? key}) : super(key: key);

  @override
  State<LocationPageBody> createState() =>
      _LocationPageBodyState();
}

class _LocationPageBodyState extends State<LocationPageBody> {
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
                      color: kSecondaryColor),
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: IconButton(
                          onPressed: () {
                            // Get.to(SOS_Service_Body());
                          },
                          icon: SvgPicture.asset(
                            AppIcons.BACK_ARR,
                          )))),
              SizedBox(
                width: Dimensions.PADDING_SIZE_SMALL,
              ),
              Text(
                "Location",
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
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraits) {
              return SizedBox(
                  height: constraits.maxHeight / 1, child: MapSample());
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_LARGE,right: Dimensions.PADDING_SIZE_EXTRA_LARGE,top: Get.height * 0.12),
            child: SizedBox(
              height: Dimensions.BUTTON_HEIGHT,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: SvgPicture.asset(AppIcons.SEARCH,),
                  ),
                  filled: true,
                  fillColor: kWhiteColor,
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                      borderSide: BorderSide.none
                  ),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: SizedBox(
                height: Dimensions.BUTTON_HEIGHT,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text(
                    "Create",
                    style :TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kWhiteColor,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>( kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                      ),
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
}

