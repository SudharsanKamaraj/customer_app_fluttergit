import 'package:customar_app/util/index_path.dart';
import 'package:customar_app/view/test.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({Key? key}) : super(key: key);

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgLightColor,
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
                width: 10,
              ),
              Text(
                "Chat Us",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.RADIUS_EXTRA_LARGE),
                              topRight: Radius.circular(Dimensions.RADIUS_EXTRA_LARGE),
                              bottomRight: (messages[index].messageType == "receiver"
                                  ? Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)
                                  : Radius.circular(0)),
                              bottomLeft: (messages[index].messageType == "receiver"
                                  ? Radius.circular(0)
                                  : Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
                            ),
                            color: (messages[index].messageType == "receiver"
                                ? kWhiteColor
                                : kSelectColor),
                          ),
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(
                              fontFamily: 'Gilroy-Mudiem',
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: (messages[index].messageType == "receiver"
                                  ? kPrimaryColor
                                  : kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Text(
                          messages[index].messageTime,
                          style: TextStyle(
                            fontFamily: 'Gilroy-Mudiem',
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Container(
                  height: Dimensions.MESSAGE_INPUT_HEIGHT,
                  width: Dimensions.MESSAGE_INPUT_HEIGHT,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_OVER_LARGE),
                    color: kWhiteColor,
                  ),
                  child: SvgPicture.asset(AppIcons.ATTACH,),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: Dimensions.MESSAGE_INPUT_HEIGHT,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                      color: kWhiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Message",
                                  border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Gilroy-Mudiem',
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                  color: kHintText,
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Gilroy-Mudiem',
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          InkWell(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: SvgPicture.asset(AppIcons.BACK_ARR,height: 12,),
                            ),
                          )
                        ],
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