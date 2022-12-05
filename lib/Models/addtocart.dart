import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProductModel {
  String ProductId;
  String ProductName;
  String ProductDescription;
  String ProductPrice;
  String ProductPostedBy;
  String ProductImage;
  CartProductModel(
      {this.ProductId = '',
      required this.ProductName,
      required this.ProductDescription,
      required this.ProductImage,
      required this.ProductPostedBy,
      required this.ProductPrice});

  static CartProductModel fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        ProductId: json['id'],
        ProductName: json['ProductName'],
        ProductDescription: json['ProductDescription'],
        ProductPrice: json['ProductPrice'],
        ProductPostedBy: json['ProductPostedBy'],
        ProductImage: json['ProductImage'],
      );
}

Stream<List<CartProductModel>> CartProducts() => FirebaseFirestore.instance
    .collection('Products')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => CartProductModel.fromJson(doc.data()))
        .toList());

// String _calculateTotal() {
//   double totalPrice = 0;
//   for (int i = 0; i < cartSnapshot.data!.docs.length; i++) {
//     totalPrice += double.parse(Cartdocumentsnapshot['ProductPrice']);
//   }
//   print(totalPrice);
//   return totalPrice.toStringAsFixed(1);
// }
