import 'package:flutter_food/constants/foodList.dart';

Map<String, double> calculateIndex(Map<String, int> cart) {
  double calorie = 0;
  double carbs = 0;
  double protein = 0;

  cart.keys.map((item) {
    calorie += foodList[item]['calorie'].toDouble() * cart[item];
    carbs += foodList[item]['carb'].toDouble() * cart[item];
    protein += foodList[item]['protein'].toDouble() * cart[item];
  }).toList();

  return {
    'calorie': calorie,
    'carbs': carbs,
    'protein': protein,
  };
}
