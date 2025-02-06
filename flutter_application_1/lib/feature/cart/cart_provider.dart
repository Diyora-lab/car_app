import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/car_model.dart';

class CartProvider extends ChangeNotifier {
  List<CarModel> carList = [];

  void addItemToCart(CarModel newItem) {
    if (carList.isEmpty) {
      carList.add(newItem.addToCart());
    } else {
      carList.first = carList.first.addToCart();
    }

    notifyListeners();
  }
}
