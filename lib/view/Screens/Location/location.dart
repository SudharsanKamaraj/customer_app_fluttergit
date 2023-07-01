import 'package:customar_app/util/index_path.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
          mobile: LocationPageBody(),
          tablet: Row(),
        )
    );
  }
}
