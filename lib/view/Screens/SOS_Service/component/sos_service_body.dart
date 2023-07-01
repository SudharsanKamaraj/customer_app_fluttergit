import 'package:customar_app/models/sos_service_data.dart';
import 'package:customar_app/util/image_const.dart';
import 'package:customar_app/util/index_path.dart';

class SOS_Service_Body extends StatefulWidget {
  const SOS_Service_Body({Key? key}) : super(key: key);

  @override
  State<SOS_Service_Body> createState() => _SOS_Service_BodyState();
}

class _SOS_Service_BodyState extends State<SOS_Service_Body> {


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
                "SOS Service",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        body: SosExpandableCard());
  }
}

class SosExpandableCard extends StatefulWidget {
  const SosExpandableCard({Key? key}) : super(key: key);

  @override
  _SosExpandableCardState createState() => _SosExpandableCardState();
}

class _SosExpandableCardState extends State<SosExpandableCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: sosData.length,
        itemBuilder: (BuildContext context,  index) {
          //print("price ${sosData[index].price}");
          return Container(
            padding: EdgeInsets.only(
              bottom: Dimensions.PADDING_SIZE_SMALL,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sosData[index].expanded = !sosData[index].expanded;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE,
                    vertical: Dimensions.PADDING_SIZE_SMALL),
                width: double.infinity,
                height: sosData[index].expanded != true
                    ? Get.height * 0.1
                    : Get.height * 0.36,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
                    color: kWhiteColor),
                child: sosData[index].expanded != true
                    ? Row(
                        children: [
                          Container(
                            width: Get.width * 0.17,
                            height: Get.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.RADIUS_LARGE),
                                color: kSecondaryColor),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                              child: Image.asset(sosData[index].img,fit: BoxFit.fill,),
                            )
                          ),
                          SizedBox(
                            width: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sosData[index].headerItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  sosData[index].subheaderItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Gilroy-Meduim',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kSelectColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "\$${sosData[index].price.toString()}",
                                ),
                                TextSpan(
                                  text: '\nBasic Price',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy-Regular',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kPrimaryColor,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: Get.height * 0.18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.RADIUS_DEFAULT),
                                color: kSecondaryColor),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                              child: Image.asset(sosData[index].img,fit: BoxFit.fill,),
                            )
                          ),
                          SizedBox(
                            width: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Padding(
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
                                            sosData[index].headerItem,
                                            style: TextStyle(
                                              fontFamily: 'Gilroy-Bold',
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          Text(
                                            sosData[index].subheaderItem,
                                            style: TextStyle(
                                              fontFamily: 'Gilroy-Bold',
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                      Text(
                                        'Basic Price - \$00',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy-Meduim',
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                            color: kPrimaryColor,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height:
                                            Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                      Text(
                                        'Additional service may cost extra',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy-Meduim',
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                            color: kPrimaryColor,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height:
                                            Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                      Text(
                                        'Advance Payment - \$00',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy-Meduim',
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                            color: kPrimaryColor,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.BUTTON_HEIGHT,
                                  width: Get.width * .27,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(()=>SOS_Service_Booking(detail: sosData[index],));
                                    },
                                    child: Text(
                                      "Book Now",
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

