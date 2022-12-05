import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future CreateProduct (
    {required String ProductName,
    required String ProductDescription,
    required String ProductPrice,
    required String ProductPostedBy,
    required String ProductImage}) async {
  final Product = FirebaseFirestore.instance.collection('Products').doc();

// to json
  final json = {
    'ProductName': ProductName,
    'ProductDescription': ProductDescription,
    'ProductPrice': ProductPrice,
    'ProductPostedBy': ProductPostedBy,
    'ProductImage': ProductImage,
  };
  await Product.set(json);

 
}
