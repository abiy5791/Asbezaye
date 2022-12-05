import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Models/addtoCart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CollectionReference _CartProduct = FirebaseFirestore.instance
      .collection('Cart')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('UserCart');

  Future<void> _delete(String docId) async {
    await _CartProduct.doc(docId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Successfully removed from cart")),
    );
  }
  // String _calculateTotal() {
//   double totalPrice = 0;
//   for (int i = 0; i < cartSnapshot.data!.docs.length; i++) {
//     totalPrice += double.parse(Cartdocumentsnapshot['ProductPrice']);
//   }
//   print(totalPrice);
//   return totalPrice.toStringAsFixed(1);
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _CartProduct.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> cartSnapshot) {
          if (cartSnapshot.hasError) {
            return Center(
              child: Text("They have an error!"),
            );
          } else if (!cartSnapshot.hasData) {
            return Center(
              child: Text("No Product In Cart"),
            );
          } else if (cartSnapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: cartSnapshot.data!.docs.length,
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          DocumentSnapshot Cartdocumentsnapshot =
                              cartSnapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(70, 158, 158, 158),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.network(
                                  Cartdocumentsnapshot['ProductImage'],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                title:
                                    Text(Cartdocumentsnapshot['ProductName']),
                                subtitle: Text(
                                    Cartdocumentsnapshot['ProductPrice'] +
                                        ' birr'),
                                trailing: IconButton(
                                    onPressed: () {
                                      _delete(Cartdocumentsnapshot.id);
                                    },
                                    icon: Icon(Icons.cancel)),
                              ),
                            ),
                          );
                        })),
                // pay now button

                Padding(
                  padding: EdgeInsets.all(36),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.green[50]),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '0' + " birr",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),

                        // pay now btn
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  DocumentSnapshot docsnap =
                                      cartSnapshot.data!.docs.last;
                                  double total = 0;
                                  for (int i = 0; i < docsnap.id.length; i++) {
                                    total +=
                                        double.parse(docsnap['ProductPrice']);
                                  }

                                  print(total);
                                },
                                child: Text(
                                  "Pay Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
