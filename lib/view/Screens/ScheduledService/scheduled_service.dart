import 'package:customar_app/util/index_path.dart';
import 'package:customar_app/view/Screens/ScheduledService/component/scheduled_service_body.dart';

class ScheduledScreen extends StatefulWidget {
  const ScheduledScreen({Key? key}) : super(key: key);

  @override
  State<ScheduledScreen> createState() => _ScheduledScreenState();
}

class _ScheduledScreenState extends State<ScheduledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
          mobile: Scheduled_Service_Body(),
          tablet: Row(),
        )
    );
  }
}