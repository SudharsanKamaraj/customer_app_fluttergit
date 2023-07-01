import 'package:customar_app/util/index_path.dart';

String totalAmount(){
  String tAmount = "0";
  int amount=0;
  for(var data in selectedScheduldData){
    amount= amount+data.price;
  }
  tAmount = amount.toString();
  return tAmount;
}

String getTaxAmount({required int taxPercentage}) {
  String taxAmount = "0";
  int total = int.parse(totalAmount());

  int taxAmountInt = (total * taxPercentage) ~/ 100;
  int totalWithTax = total + taxAmountInt;

  taxAmount = totalWithTax.toString();
  return taxAmount;
}