import 'package:customar_app/util/index_path.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int taxPercentageValue = 10;

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
              "Cart",
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
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: selectedScheduldData.map(
                      (item) {
                        return Container(
                          margin: EdgeInsets.only(
                              bottom: Dimensions.PADDING_SIZE_SMALL),
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_LARGE,
                            vertical: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          width: double.infinity,
                          height: Get.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.RADIUS_LARGE),
                              color: kWhiteColor),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.headerItem,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Bold',
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Meduim',
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: kPrimaryColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '\$${item.price}\n',
                                        style: TextStyle(color: kSelectColor)),
                                    TextSpan(
                                      text: '25% off ',
                                      style:
                                          TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                    TextSpan(
                                      text: '\$00 ',
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_SMALL,
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
                                    setState(() {
                                      selectedScheduldData.remove(item);
                                      print("removed: ${selectedScheduldData}");
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.PADDING_SIZE_SMALL),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE),
                          color: kSelectLtColor),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.RADIUS_LARGE),
                                            borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontFamily: 'Gilroy-Medium',
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: kPrimaryColor,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    hintText: "Add Service Description",
                                  )),
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
                                      AppIcons.EDIT,
                                      color: kWhiteColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MySeparator(color: kWhiteColor),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_SMALL,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    '*A short text describing the required service. It helps the technician to understand the issue and prepare.',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Medium',
                                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  '500/500',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy-Medium',
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
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
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.RADIUS_LARGE),
                                      borderSide: BorderSide.none),
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
                              'Item Total',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Midum',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              "\$${totalAmount()}",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Midum',
                                fontSize: Dimensions.FONT_SIZE_SMALL,
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
                              'Taxes and Charges',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Midum',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              '\$${taxPercentageValue}',
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
                              "Cart Value",
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            ),
                            Text(
                             "\$${ getTaxAmount(taxPercentage: taxPercentageValue)}",
                                style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: kSelectColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.BUTTON_HEIGHT,
                    width: Get.width * .27,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(CheckoutScreen());
                      },
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
