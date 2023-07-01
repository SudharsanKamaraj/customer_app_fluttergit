import 'package:customar_app/util/index_path.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key,}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  int taxPercentageValue = 7;

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
                "Payment Details",
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_SMALL),
                        width: double.infinity,
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                            color: kWhiteColor),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Battery Jumpstart",
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Bold',
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Bold',
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
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
                                    text: "\$000\n",
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
                        )),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_LARGE),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kWhiteColor),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Spare Parts Added',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Text(
                                '3 items',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Mudium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children:
                            _itemData.map((e) => _spareList(e)).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_SMALL),
                        width: double.infinity,
                        height: Get.height * 0.14,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE),
                            color: kWhiteColor),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_LARGE,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Apply Coupon',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy-Bold',
                                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
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
                                        AppIcons.PERCENTAGE,
                                        color: kWhiteColor,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontFamily: 'Gilroy-Regular',
                                        fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                        color: kPrimaryColor,
                                        fontStyle: FontStyle.italic),
                                    enabledBorder: InputBorder.none,
                                    hintText: "Type Coupon Code Here",
                                    contentPadding: EdgeInsets.only(
                                        left: Dimensions.PADDING_SIZE_LARGE))),
                            MySeparator(color: kSelectLtColor),
                          ],
                        )),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_LARGE,
                          vertical: Dimensions.PADDING_SIZE_LARGE),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kWhiteColor),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bill Details',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              Container(
                                height: 25,
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
                                    AppIcons.DOLAR,
                                    color: kWhiteColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_DEFAULT,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Service Charge',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                "\$00",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Advance Paid',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                '-\$00',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          MySeparator(color: kSelectLtColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Added Item Total',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                '\$00',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          MySeparator(color: kSelectLtColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Taxes and Charges',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                '\$00',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          MySeparator(color: kSelectLtColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Coupon Discount',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                '-\$00',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Midum',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          MySeparator(color: kSelectLtColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'To Pay',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Text(
                                "\$${ getTaxAmount(taxPercentage: taxPercentageValue)}",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.12,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Get.height * 0.1,
                color: kWhiteColor,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                    vertical: Dimensions.PADDING_SIZE_LARGE),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${getTaxAmount(taxPercentage: taxPercentageValue)}",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Bold',
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: kSelectColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                              ),
                              Text(
                                "View Bill Details",
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.BUTTON_HEIGHT,
                      width: Get.width * .37,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(Payment_Success_feedback());
                        },
                        child: Text(
                          "Make Payment",
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
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  Widget _spareList (SpareItem spareItem) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                  ),
              child: Image.asset(spareItem.img),
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
                    spareItem.headerItem,
                    style: TextStyle(
                      fontFamily: 'Gilroy-Medium',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    spareItem.subheaderItem,
                    style: TextStyle(
                      fontFamily: 'Gilroy-Regular',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
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
                  fontFamily: 'Gilroy-Medium',
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: kPrimaryColor,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\$00\n',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      color: kSelectColor,
                    )
                  ),
                  TextSpan(
                    text: '25% off ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    ),
                  ),
                  TextSpan(
                    text: '\$00 ',
                    style: TextStyle(
                        decoration:
                        TextDecoration.lineThrough,
                        fontStyle: FontStyle.italic,
                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        ),
        Divider(
          height: 2,
          color: kSelectLtColor,
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
        ),
      ],
    );
  }
}

List<SpareItem> _itemData = <SpareItem>[
  SpareItem(
    headerItem: 'Amaron ( 55 Months Warranty )',
    subheaderItem: '1 unit',
    img: AppImages.SPARE1
  ),
  SpareItem(
    headerItem: 'Alternator Replacement',
    subheaderItem: '1 unit',
      img: AppImages.SPARE2
  ),
  SpareItem(
    headerItem: 'Alternator Repair',
    subheaderItem: '1 unit',
      img: AppImages.SPARE3
  ),
];

class SpareItem {
  String headerItem, subheaderItem,img;

  SpareItem({
    required this.headerItem,
    required this.subheaderItem,
    required this.img,
  });
}

// body: ListView(
//    children: [
//      Padding(
//        padding: EdgeInsets.symmetric(
//            horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
//            vertical: Dimensions.PADDING_SIZE_LARGE),
//        child: Column(
//          children: [
//            Container(
//                padding: EdgeInsets.symmetric(
//                    horizontal: Dimensions.PADDING_SIZE_LARGE,
//                    vertical: Dimensions.PADDING_SIZE_SMALL),
//                width: double.infinity,
//                height: Get.height * 0.1,
//                decoration: BoxDecoration(
//                    borderRadius:
//                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
//                    color: kWhiteColor),
//                child: Row(
//                  children: [
//                    Container(
//                      width: Get.width * 0.15,
//                      height: Get.height * 0.3,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(
//                              Dimensions.RADIUS_DEFAULT),
//                          color: kSecondaryColor),
//                    ),
//                    SizedBox(
//                      width: Dimensions.PADDING_SIZE_SMALL,
//                    ),
//                    Expanded(
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          Text(
//                            'Battery Jumpstart',
//                            style: TextStyle(
//                              fontFamily: 'Gilroy-Bold',
//                              fontSize: Dimensions.FONT_SIZE_LARGE,
//                              color: kPrimaryColor,
//                            ),
//                          ),
//                          Text(
//                            '',
//                            style: TextStyle(
//                              fontFamily: 'Gilroy-Bold',
//                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
//                              color: kPrimaryColor,
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    RichText(
//                      textAlign: TextAlign.right,
//                      text: TextSpan(
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                        children: const <TextSpan>[
//                          TextSpan(
//                            text: '\$00\n',
//                          ),
//                          TextSpan(
//                            text: 'Basic Price',
//                            style: TextStyle(
//                                fontFamily: 'Gilroy-Regular',
//                                fontSize: Dimensions.FONT_SIZE_SMALL,
//                                color: kPrimaryColor,
//                                fontStyle: FontStyle.italic),
//                          ),
//                        ],
//                      ),
//                    )
//                  ],
//                )),
//            SizedBox(
//              height: Dimensions.PADDING_SIZE_DEFAULT,
//            ),
//            Container(
//              padding: EdgeInsets.symmetric(
//                  horizontal: Dimensions.PADDING_SIZE_LARGE,
//                  vertical: Dimensions.PADDING_SIZE_LARGE),
//              width: double.infinity,
//              decoration: BoxDecoration(
//                  borderRadius:
//                      BorderRadius.circular(Dimensions.RADIUS_LARGE),
//                  color: kWhiteColor),
//              child: Column(
//                children: [
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Spare Parts Added',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      SizedBox(
//                        height: Dimensions.PADDING_SIZE_SMALL,
//                      ),
//                      Text(
//                        '3 items',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Mudium',
//                          fontSize: Dimensions.FONT_SIZE_SMALL,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_SMALL,
//                  ),
//                  ListView(
//                    shrinkWrap: true,
//                    children:
//                        _itemData.map((e) => _listviwe(e)).toList(),
//                  ),
//                ],
//              ),
//            ),
//            SizedBox(
//              height: Dimensions.PADDING_SIZE_DEFAULT,
//            ),
//            Container(
//              padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
//                width: double.infinity,
//                height: Get.height * 0.15,
//                decoration: BoxDecoration(
//                    borderRadius:
//                        BorderRadius.circular(Dimensions.RADIUS_LARGE),
//                    color: kWhiteColor),
//                child: Column(
//                  children: [
//                    Padding(
//                      padding: EdgeInsets.symmetric(
//                          horizontal: Dimensions.PADDING_SIZE_LARGE,),
//                      child: Row(
//                        children: [
//                          Expanded(
//                            child: Text(
//                              'Apply Coupon',
//                              style: TextStyle(
//                                fontFamily: 'Gilroy-Bold',
//                                fontSize: Dimensions.FONT_SIZE_LARGE,
//                                color: kPrimaryColor,
//                              ),
//                            ),
//                          ),
//                          Container(
//                            height: 30,
//                            width: 30,
//                            padding: EdgeInsets.all(7),
//                            decoration: BoxDecoration(
//                                color: kSecondaryColor,
//                                borderRadius: BorderRadius.circular(100)),
//                            child: InkWell(
//                              child: SvgPicture.asset(
//                                AppIcons.PERCENTAGE,
//                              ),
//                              onTap: () {},
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                    TextField(
//                      decoration: InputDecoration(
//                        hintStyle: TextStyle(
//                          fontFamily: 'Gilroy-Regular',
//                          fontSize: Dimensions.FONT_SIZE_SMALL,
//                          color: kPrimaryColor,
//                          fontStyle: FontStyle.italic
//                        ),
//                        hintText: "Type Coupon Code Here",
//                          contentPadding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE)
//                          )
//                    )
//                  ],
//                )),
//            SizedBox(
//              height: Dimensions.PADDING_SIZE_DEFAULT,
//            ),
//            Container(
//              padding: EdgeInsets.symmetric(
//                  horizontal: Dimensions.PADDING_SIZE_LARGE,
//                  vertical: Dimensions.PADDING_SIZE_LARGE),
//              width: double.infinity,
//              decoration: BoxDecoration(
//                  borderRadius:
//                  BorderRadius.circular(Dimensions.RADIUS_LARGE),
//                  color: kWhiteColor),
//              child: Column(
//                children: [
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Bill Details',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      SizedBox(
//                        height: Dimensions.PADDING_SIZE_SMALL,
//                      ),
//                      Container(
//                        height: 30,
//                        width: 30,
//                        padding: EdgeInsets.all(7),
//                        decoration: BoxDecoration(
//                            color: kSecondaryColor,
//                            borderRadius: BorderRadius.circular(100)),
//                        child: InkWell(
//                          child: SvgPicture.asset(
//                            AppIcons.DOLAR,
//                          ),
//                          onTap: () {},
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_DEFAULT,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Service Charge',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Advance Paid',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '-\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_SMALL,
//                  ),
//                  Divider(
//                    height: 2,
//                    color: kSecondaryColor,
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Added Item Total',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_SMALL,
//                  ),
//                  Divider(
//                    height: 2,
//                    color: kSecondaryColor,
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Taxes and Charges',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_SMALL,
//                  ),
//                  Divider(
//                    height: 2,
//                    color: kSecondaryColor,
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'Coupon Discount',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Midum',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_SMALL,
//                  ),
//                  Divider(
//                    height: 2,
//                    color: kSecondaryColor,
//                  ),
//                  SizedBox(
//                    height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        'To Pay',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      Text(
//                        '\$00',
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_LARGE,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//      Container(
//        width: double.infinity,
//        height: Get.height * 0.1,
//        color: kWhiteColor,
//        padding: EdgeInsets.symmetric(
//            horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,
//            vertical: Dimensions.PADDING_SIZE_LARGE),
//        child: Row(
//          children: [
//            Expanded(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text(
//                        "\$000",
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Bold',
//                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                      SizedBox(
//                        height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//                      ),
//                      Text(
//                        "View Bill Details",
//                        style: TextStyle(
//                          fontFamily: 'Gilroy-Medium',
//                          fontSize: Dimensions.FONT_SIZE_SMALL,
//                          color: kPrimaryColor,
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//            SizedBox(
//              height: Dimensions.BUTTON_HEIGHT,
//              width: Get.width * .37,
//              child: ElevatedButton(
//                onPressed: () {
//
//                },
//                child: Text(
//                  "Make Payment",
//                  style: TextStyle(
//                    fontFamily: 'Gilroy-Bold',
//                    fontSize: Dimensions.FONT_SIZE_LARGE,
//                    color: kWhiteColor,
//                  ),
//                ),
//                style: ButtonStyle(
//                  backgroundColor:
//                      MaterialStateProperty.all<Color>(kPrimaryColor),
//                  shape:
//                      MaterialStateProperty.all<RoundedRectangleBorder>(
//                    RoundedRectangleBorder(
//                      borderRadius:
//                          BorderRadius.circular(Dimensions.RADIUS_LARGE),
//                    ),
//                  ),
//                ),
//              ),
//            )
//          ],
//        ),
//      )
//    ],
//  )


