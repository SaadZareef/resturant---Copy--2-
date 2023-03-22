import 'package:flutter/cupertino.dart';
import 'package:resturant/Database/db.dart';
import 'package:resturant/model/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/dish.dart';

class CartProvider with ChangeNotifier {
  // DatabaseHelper db = DatabaseHelper.constructor();
  int _counter = 0;
  int get counter => _counter;
  late List<DishModel> allDishes;

  // double _totalPrice = 0.0 ;
  // double get totalPrice => _totalPrice;

  late Future<List<OrdersModel>> _cart;
  Future<List<OrdersModel>> get cart => _cart;

  // Future<List<OrdersModel>> getData() async {
  //   _cart = db.getAllOrders();
  //   allDishes = await db.getAllDishes();
  //   return _cart;
  // }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    // prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    // _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  // void addTotalPrice (double productPrice){
  //    _totalPrice = _totalPrice +productPrice ;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // void removeTotalPrice (double productPrice){
  //   _totalPrice = _totalPrice  - productPrice ;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // double getTotalPrice (){
  //   _getPrefItems();
  //   return  _totalPrice ;
  // }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }
}
