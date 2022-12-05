import 'package:asbezaye/MerchantsPage/PostItemsScreen.dart';
import 'package:asbezaye/Models/Cart_model.dart';
import 'package:asbezaye/Models/addtocart.dart';
import 'package:asbezaye/Screens/CartScreen.dart';
import 'package:asbezaye/Screens/CatagoryScreen.dart';
import 'package:asbezaye/Screens/SplashScreen.dart';
import 'package:asbezaye/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _Products =
      FirebaseFirestore.instance.collection('Products');
//Dark mode Light Mode

  bool _isDark = false;

  IconData _LightIcon = Icons.wb_sunny;
  IconData _DarkIcon = Icons.nights_stay;

  ThemeData _LightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(),
  );

  ThemeData _DarkTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  );



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //dark mode light mode part
      theme: _isDark ? _DarkTheme : _LightTheme,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            ),
          ),
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              Text(
                "0.0",
                // value.calculateTotal(),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.green,
                ),
              ),
              Text(
                ' Birr',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          title: Text(
            "Asbezaye",
            style: GoogleFonts.abel(
              textStyle: TextStyle(fontSize: 25, color: Colors.green),
            ),
          ),
          centerTitle: true,
          brightness: Brightness.light,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.green[500]),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isDark = !_isDark;
                });
              },
              icon: Icon(_isDark ? _DarkIcon : _LightIcon),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: _Products.snapshots(),
            builder: ((context, AsyncSnapshot<QuerySnapshot> StreamSnapshot) {
              // return Consumer<CartModel>(builder: (context, value, child) {
              if (StreamSnapshot.hasData) {
                return Column(
                  children: [
                    // circles on the top of the page

                    Container(
                      height: 110,
                      child: ListView.builder(
                        itemCount: StreamSnapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          final DocumentSnapshot documentSnapshot =
                              StreamSnapshot.data!.docs[index];
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {
                                    // Provider.of<CartModel>(context,
                                    //         listen: false)
                                    //     .addToCatagory(index);
                                    // Navigator.push(
                                    //     context,
                                    //     PageTransition(
                                    //         child: CatagoryScreen(),
                                    //         type: PageTransitionType
                                    //             .bottomToTop));
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              documentSnapshot['ProductImage']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                documentSnapshot['ProductName'],
                                style: GoogleFonts.abel(),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),

                    // Post Listview
                    Expanded(
                      child: ListView.builder(
                        itemCount: StreamSnapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          final DocumentSnapshot documentSnapshot =
                              StreamSnapshot.data!.docs[index];
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['ProductImage']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text("This Product is Posted by " +
                                  documentSnapshot['ProductPostedBy']),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: ReadMoreText(
                                  documentSnapshot['ProductDescription'],
                                  trimLength: 150,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  colorClickableText: Colors.green,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "The Price of 1kg = " +
                                    documentSnapshot['ProductPrice'] +
                                    " birr",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Provider.of<CartModel>(context, listen: false)
                                  //     .addItemToCart(index);

                                  FirebaseFirestore.instance
                                      .collection('Cart')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('UserCart')
                                      .doc()
                                      .set({
                                    'ProductName':
                                        documentSnapshot['ProductName'],
                                    'ProductDescription':
                                        documentSnapshot['ProductDescription'],
                                    'ProductPrice':
                                        documentSnapshot['ProductPrice'],
                                    'ProductPostedBy':
                                        documentSnapshot['ProductPostedBy'],
                                    'ProductImage':
                                        documentSnapshot['ProductImage'],
                                  });
                                },
                                child: ButtonWidget(
                                  horizontalPadding: 15,
                                  verticalPadding: 8,
                                  ContainerColor: Colors.green,
                                  HaveIcon: false,
                                  btnText: "Add To Zenbil",
                                  borderRadius: 10,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        }),
                      ),
                      // }),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })),
        // drawer part
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(73, 23, 158, 13)),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(111, 255, 255, 255),
                        image: DecorationImage(
                          image: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // "Abiy Teklu",
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Text(FirebaseAuth.instance.currentUser!.email!),
                  ],
                ),
              ),
              ListTile(
                title: const Text('My Account'),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Post Product'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return PostItemsScreen();
                    },
                  ), (route) => false);
                },
              ),
              ListTile(
                title: const Text('Today Order'),
                onTap: () {},
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                  title: GestureDetector(
                      onTap: () {
                        AuthService().signOut();
                      },
                      child: Text('Log out'))),
            ],
          ),
        ),
      ),
    );
  }
}
