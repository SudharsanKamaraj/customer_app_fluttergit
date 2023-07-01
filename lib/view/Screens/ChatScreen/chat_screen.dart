import 'package:customar_app/util/index_path.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
          mobile: ChatScreenBody(),
          tablet: Row(),
        )
    );
  }
}
