import 'package:flutter_food/constants/foodList.dart';

int getTotal(Map<String, int> cart) {
  int total = 0;
  cart.keys.map((item) {
    int price = foodList[item]['price'] * cart[item];
    total += price;
  }).toList();

  return total;
}
