import 'package:customar_app/util/index_path.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor customIcon;
  final MapController mapController = Get.put(MapController());
  // var map_controller = Get.put(MapController());
  // LocationData? _currentLocation;

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // void setCustomMarkerIcon() async {
  //   customIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), AppIcons.LOCATION_MARKER
  //   );
  // }

  // Future<void> getLocation() async {
  //   try {
  //     await map_controller.getLocation();
  //   } catch (e) {
  //     // Handle error
  //   }
  //   Location location = Location();
  //   LocationData currentLocation = await location.getLocation();
  //   setState(() {
  //     _currentLocation = currentLocation;
  //   });
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(
  //           currentLocation.latitude!,
  //           currentLocation.longitude!,
  //         ),
  //         zoom: 15,
  //       ),
  //     ),
  //   );
  // }

  // static const LatLng sourceLocation =  LatLng(11.049983, 77.054013);
  // static const LatLng destination = LatLng(11.036933, 77.038318);
  //
  // late List<LatLng> polylineCoordinates;
  //
  // void getPolyPoints() {
  //   polylineCoordinates = [
  //     sourceLocation,
  //     LatLng(11.044903, 77.054327),
  //     LatLng(11.045973, 77.053319),
  //     LatLng(11.048040, 77.052460),
  //     destination,
  //   ];
  // }

  @override
  void initState() {
    super.initState();
    //map_controller = MapController();
    //setCustomMarkerIcon();
    //getLocation();
    //getPolyPoints();
    Future.delayed(Duration(seconds: 4), () {
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        compassEnabled: false,
        initialCameraPosition: MapController.kGooglePlex,
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: mapController.polylineCoordinates,
            color: kOrangeC,
            width: 6,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: mapController.thisLocation != null
            ? {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(
              mapController.thisLocation!.latitude!,
              mapController.thisLocation!.longitude!,
            ),
            icon: mapController.customIcon,
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: MapController.sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: MapController.destination,
          ),
        }
            : {},
      )
    );
  }
}
