import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartModel extends ChangeNotifier {
  // List of items on sell
  List _shopItems = [
    [
      'assets/Grocery/tomatoes2.jpg',
      'Abebe Tesema',
      'This is heigh quality and fresh tomato 1 kg of tomato is 20 birr and all other description about the thingPrice 1kg = 20 birr and all other description about the thingPrice 1kg = 20 birr and all other description about the thingPrice 1kg = 20 birr and all other description about the thingPrice 1kg = 20 birr and all other description about the thing. ',
      '20',
      'Tomato',
    ],
    [
      'assets/Grocery/potatoes.jpg',
      'Kebede Abera',
      'Price of 1kg Potato is 15 birr and other description about the Potato.....',
      '15',
      'Potato',
    ],
    [
      'assets/Grocery/onion2.jpg',
      'Mimi Raju',
      'description about the Onion ..... and other details.',
      '40',
      'Onion',
    ],
    [
      'assets/Grocery/cabbage.jpg',
      'Halima Ali',
      'description about the Cabbage ..... and other related details.',
      '25',
      'Cabbage',
    ],
    [
      'assets/Grocery/carrots.jpg',
      'Ahemed Ali',
      'description about the Carrot ..... and other related details.',
      '50',
      'Carrot',
    ],
    [
      'assets/Grocery/bananas.jpg',
      'Bekele Tolesa',
      'description about the Cabbage ..... and other related details.',
      '25',
      'Bananan',
    ],
    [
      'assets/Grocery/appetite.jpg',
      'Bekele Tolesa',
      'description about the Cabbage ..... and other related details.',
      '25',
      'Pepper',
    ],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][3]);
    }
    return totalPrice.toStringAsFixed(1);
  }

  List _SelectedCatagory = [];
  get SelectedCategory => _SelectedCatagory;

  void addToCatagory(int index) {
    _SelectedCatagory.add(_shopItems[index]);
    notifyListeners();
  }

  void CataExit(int index) {
    _SelectedCatagory.removeAt(index);
    notifyListeners();
  }
  
 

// List of Catagory items

  List _CatagoryItems = [
    ['assets/Grocery/tomatoes.jpg', 'Tomato'],
    ['assets/Grocery/potatoes.jpg', 'Potato'],
    ['assets/Grocery/onions.jpg', 'Onion'],
    ['assets/Grocery/cabbage.jpg', 'Cabbage'],
    ['assets/Grocery/carrots.jpg', 'Carrot'],
    ['assets/Grocery/bananas.jpg', 'Bananan'],
    ['assets/Grocery/appetite.jpg', 'Pepper'],
  ];
  get CatagoryItems => _CatagoryItems;
}
