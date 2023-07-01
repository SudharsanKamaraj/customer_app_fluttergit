import 'package:customar_app/util/index_path.dart';

class LocationPermission extends StatefulWidget {
  const LocationPermission({Key? key}) : super(key: key);

  @override
  State<LocationPermission> createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
      body: Stack(
        children: [
          Image.asset(AppImages.MAP_BG,fit: BoxFit.fitWidth,),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.1,),
                Text(
                  "Where Are you?",
                  style :TextStyle(
                    fontFamily: 'Gilroy-Bold',
                    fontSize: Dimensions.FONT_SIZE_SUPER_LARGE,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                Expanded(
                  child: Text(
                    "We need to access you location to provide our services.",
                    style :TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.BUTTON_HEIGHT,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(HomePage());
                    },
                    child: Text(
                      "Access my location",
                      style :TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kWhiteColor,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>( kSelectColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Select location manually",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kSelectColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
