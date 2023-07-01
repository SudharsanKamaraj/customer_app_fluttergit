import 'package:customar_app/util/index_path.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
          mobile: GetPhoneNumber(),
          tablet: Row(),
        )
    );
  }
}
