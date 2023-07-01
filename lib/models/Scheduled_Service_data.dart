import 'package:customar_app/util/index_path.dart';

List<Item> selectedScheduldData=<Item>[

];

List<Item> scheduldData = <Item>[
  Item(
    headerItem: 'Standard Service',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 200,
  ),
  Item(
    headerItem: 'Comprehensive Service',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 300,
  ),
  Item(
    headerItem: 'Front Brake Discs',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 400,
  ),
  Item(
    headerItem: 'Disc Turning',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 500,
  ),
  Item(
    headerItem: 'Caliper Pin Replacement',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 600,
  ),
  Item(
    headerItem: 'Steering Rack Repair',
    miles: 'Every 5000 miles / 3 months',
    time: 'Takes 4 Hours',
    warranty: '1 Month Warranty',
    services: 'Includes 9 Services',
    price: 700,
  ),
  // ItemModel(
  //   id: 5,
  //   headerItem: 'Caliper Pin Replacement',
  //   miles: 'Every 5000 miles / 3 months',
  //   time: 'Takes 4 Hours',
  //   warranty: '1 Month Warranty',
  //   services: 'Includes 9 Services',
  //   productPrice: '000',
  //   productId: null,
  // ),
];

class Item {
  String headerItem;
  String miles;
  bool expanded;
  String time;
  String warranty;
  String services;
  int price;

  Item({
    required this.headerItem,
    required this.miles,
    this.expanded: false,
    required this.time,
    required this.warranty,
    required this.services,
    required this.price,
  });

  Map toJson() {
    return {
      'headerItem': headerItem,
      'miles': miles,
      'time': time,
      'warranty': warranty,
      'services': services,
      'price': price,
    };
  }

}

// class ItemModel {
//   late final int? id;
//   ValueNotifier<int>? quantity;
//   final String? productName;
//   final int? initialPrice;
//   final int? productPrice;
//   String? productId;
//   String headerItem;
//   // String miles;
//   // String time;
//   // String warranty;
//   // String services;
//   // bool expanded;
//
//   ItemModel({
//     required this.id,
//     this.quantity,
//     this.productName,
//     this.initialPrice,
//     required this.productPrice,
//     required this.productId,
//     required this.headerItem,
//     // required this.miles,
//     // required this.time,
//     // required this.warranty,
//     // required this.services,
//     // this.expanded: false,
//   });
//
//   ItemModel.fromMap(Map<dynamic, dynamic> data)
//       : id = data['id'],
//         productId = data['productId'],
//         productName =data['productName'],
//         initialPrice = data['initialPrice'],
//         productPrice = data['productPrice'],
//         quantity = ValueNotifier(data['quantity']),
//         headerItem = data['headerItem'];
//         // miles = data['miles'],
//         // time = data['time'],
//         // warranty = data['warranty'],
//         // services = data['services'],
//         // expanded = data['expanded'],;
//
//   Map<String, Object?> toMap() {
//     return {
//       'id': id,
//       'productName' : productName,
//       'initialPrice' : initialPrice,
//        'productPrice': productPrice,
//       'quantity': quantity?.value,
//       'productId': productId,
//       // 'headerItem' : headerItem,
//       // 'miles' : miles,
//       // 'time' : time,
//       // 'warranty' : warranty,
//       // 'services' : services,
//     };
//   }
// }
