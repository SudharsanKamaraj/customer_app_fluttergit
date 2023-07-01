import 'package:customar_app/util/index_path.dart';
import 'package:customar_app/view/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        //home: SplashScreen(),
      );
  }
}


//FractionallySizedBox()