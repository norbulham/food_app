
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/card_model.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/model/deliver_model.dart';

import 'pages/deliver_homepage.dart';
class ManageState with ChangeNotifier {
  //for bookmark
  int _counter = 0;

  get currentIndex => null;

  get counter2 => null;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<DeliverModel> _bookProducts = [];

  bool addToBook(DeliverModel product) {
    if(!_bookProducts.contains(product)) {
      _bookProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }

  List<DeliverModel> get bookProducts => _bookProducts;

  void increaseQuantity(DeliverModel product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(DeliverModel product) {
    if(product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    } else {
      _bookProducts.remove(product);
      _counter--;
      notifyListeners();
    }
  }

///favoriite page
  List<CategoryModel> _fav = [];
  List<CategoryModel> get fav=>_fav;

  bool addToFav(CategoryModel product) {
    if(!_fav.contains(product)) {
      _fav.add(product);
            // _counter++;
      product.isFav = true;
      notifyListeners();
      return true;
    }
    else {
      _fav.remove(product);
      // _counter++;
      product.isFav = false;
      notifyListeners();
      return false;
    }
  }
  double calculate() {
    double total = 0;
    for(var product in myfavv) {
      total = total + product.price * product.quantity;
    }
    return total;
  }

  ///myfavorite (chicken)
  List<CardModel> _myfavv = [];
  List<CardModel> get myfavv=>_myfavv;

  bool addToMyFav(CardModel product) {
    if(!_myfavv.contains(product)) {
      _myfavv.add(product);
            // _counter++;
      product.myFav = true;
      notifyListeners();
      return true;
    }
    else {
      _myfavv.remove(product);
      // _counter++;
      product.myFav = false;
      notifyListeners();
      return false;
    }
  }

  void deleteFav(CardModel product){
    _myfavv.remove(product);
    _counter--;
    notifyListeners();
  }

  void incrmentQuantity(CardModel product) {
    product.quantity++;
    notifyListeners();
  }

  void decrmentQuantity(CardModel product) {
    if(product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    } else {
      _myfavv.remove(product);
      _counter--;
      notifyListeners();
    }
  }
}






