import 'package:customar_app/util/index_path.dart';

class OnboardBodyCont extends StatefulWidget {
  const OnboardBodyCont({Key? key}) : super(key: key);

  @override
  State<OnboardBodyCont> createState() => _OnboardBodyContState();
}

class _OnboardBodyContState extends State<OnboardBodyCont> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         PageView.builder(
           physics: BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Expanded(
            child:Column(
              children: <Widget>[
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index) => buildDot(index: index),
                )
                ),
                SizedBox(height: Get.height * 0.24,)
              ],
            ),
          ),
        ],
      ),
    );
  }
  Container buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      height: Dimensions.PADDING_SIZE_SMALL,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kSelectColor
      ),
    );
  }
}


class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
        SvgPicture.asset(AppImages.BOOKING),
          SizedBox(height: Get.height * 0.2,),
        SizedBox(
          width: Get.width * 0.8,
          child: Text(
              OnboardScr.OB1_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Gilroy-Bold',
              fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
              color: kPrimaryColor,
            ),
          ),
        ),
          SizedBox(height: Get.height * 0.03,),
          InkWell(
            onTap: (){
              Get.to(AuthScreen());
            },
            child: Container(
                height: Dimensions.BUTTON_HEIGHT,
              width: Get.width * 0.25,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: kSelectColor,
                    width: 1,
                  )
              ),
              child: SvgPicture.asset(AppImages.next_arr,)
            ),
          ),
          SizedBox(height: Get.height * 0.04,),
      ],)
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(AppImages.TRACKING),
            SizedBox(height: Get.height * 0.15,),
            SizedBox(
              width: Get.width * 0.8,
              child: Text(
                OnboardScr.OB2_TEXT,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03,),
            InkWell(
              onTap: (){
                Get.to(AuthScreen());
              },
              child: Container(
                  height: Dimensions.BUTTON_HEIGHT,
                  width: Get.width * 0.25,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: kSelectColor,
                        width: 1,
                      )
                  ),
                  child: SvgPicture.asset(AppImages.next_arr,)
              ),
            ),
            SizedBox(height: Get.height * 0.04,),
          ],)
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(AppImages.CALL_CENTER),
            SizedBox(height: Get.height * 0.2,),
            SizedBox(
              width: Get.width * 0.8,
              child: Text(
                OnboardScr.OB3_TEXT,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: Dimensions.FONT_SIZE_ULTRA_LARGE,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03,),
            InkWell(
              onTap: (){
                Get.to(AuthScreen());
              },
              child: Container(
                  height: Dimensions.BUTTON_HEIGHT,
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    color: kSelectColor
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        color: kWhiteColor,
                      ),
                    ),
                  )
              ),
            ),
            SizedBox(height: Get.height * 0.04,),
          ],)
    );
  }
}

