import 'package:customar_app/util/index_path.dart';

class SOS_Service extends StatefulWidget {
  const SOS_Service({Key? key}) : super(key: key);

  @override
  State<SOS_Service> createState() => _SOS_ServiceState();
}

class _SOS_ServiceState extends State<SOS_Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
          mobile: SOS_Service_Body(),
          tablet: Row(),
        )
    );
  }
}
