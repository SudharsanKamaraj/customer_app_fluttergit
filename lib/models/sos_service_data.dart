import 'package:customar_app/util/image_const.dart';

List<SOSItemModel> sosData = <SOSItemModel>[
  SOSItemModel(
    headerItem: 'Fluid Leakage',
    subheaderItem: '',
    img: AppImages.SOS_SERVICE1,
    price: 100,
  ),
  SOSItemModel(
    headerItem: 'Wheel Lift Tow',
    subheaderItem: '( 20 miles )',
    img: AppImages.SOS_SERVICE2,
    price: 200,
  ),
  SOSItemModel(
    headerItem: 'Flat - Bed Tow',
    subheaderItem: '( 20 miles )',
    img: AppImages.SOS_SERVICE3,
    price: 300,
  ),
  SOSItemModel(
    headerItem: 'Battery Jumpstart',
    subheaderItem: '',
    img: AppImages.SOS_SERVICE4,
    price: 400
  ),
  SOSItemModel(
    headerItem: 'Clutch Breakdown',
    subheaderItem: '',
    img: AppImages.SOS_SERVICE5,
    price: 500
  ),
  SOSItemModel(
    headerItem: 'Engine Scanning',
    subheaderItem: '',
    img: AppImages.SOS_SERVICE6,
    price: 600
  ),
  SOSItemModel(
    headerItem: 'Engine Scanning',
    subheaderItem: '',
    img: AppImages.SOS_SERVICE7,
    price: 700,
  ),
];

class SOSItemModel {
  bool expanded;
  String headerItem, subheaderItem;
  String img;
  int price;

  SOSItemModel({
    this.expanded: false,
    required this.headerItem,
    required this.subheaderItem,
    required this.img,
    required this.price,
  });
}