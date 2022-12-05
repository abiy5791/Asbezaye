// import 'package:asbezaye/Screens/CartScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:readmore/readmore.dart';
// import '../Models/Cart_model.dart';
// import '../Widgets/button_widget.dart';

// class CatagoryScreen extends StatefulWidget {
//   const CatagoryScreen({Key? key}) : super(key: key);

//   @override
//   State<CatagoryScreen> createState() => _CatagoryScreenState();
// }

// class _CatagoryScreenState extends State<CatagoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton:
//           Consumer<CartModel>(builder: ((context, value, child) {
//         return FloatingActionButton(
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return CartScreen();
//               },
//             ),
//           ),
//           backgroundColor: Colors.black,
//           child: Column(
//             children: [
//               Icon(
//                 Icons.shopping_bag,
//                 color: Colors.white,
//               ),
//               Text(
//                 value.calculateTotal(),
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.green,
//                 ),
//               ),
//               Text(
//                 ' Birr',
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         );
//       })),
//       appBar: AppBar(
//         title: Text(
//           "Asbezaye",
//           style: GoogleFonts.abel(
//             textStyle: TextStyle(fontSize: 25, color: Colors.green),
//           ),
//         ),
//         centerTitle: true,
//         brightness: Brightness.light,
//         shadowColor: Colors.transparent,
//         iconTheme: IconThemeData(color: Colors.green[500]),
//         backgroundColor: Colors.transparent,
//       ),
//       body: Consumer<CartModel>(builder: (context, value, child) {
//         return Column(
//           children: [
//             // Post Listview
           
//             Expanded(
//               child: ListView.builder(
//                 itemCount: value.SelectedCategory.length,
//                 itemBuilder: ((context, index) {
//                   return Column(
//                     children: [
                      
//                       Padding(
//                         padding: EdgeInsets.all(0),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 350,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage(
//                                     value.SelectedCategory[index][0])),
//                           ),
//                         ),
//                       ),
//                       Text("Posted by " +
//                           value.SelectedCategory[index][1] +
//                           " 17 Kebele"),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         child: ReadMoreText(
//                           value.SelectedCategory[index][2],
//                           trimLength: 150,
//                           style: TextStyle(
//                               fontSize: 13, fontWeight: FontWeight.w500),
//                           colorClickableText: Colors.green,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "1kg = " + value.SelectedCategory[index][3] + "birr",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Provider.of<CartModel>(context, listen: false)
//                               .addItemToCart(index);
//                         },
//                         child: ButtonWidget(
//                           horizontalPadding: 15,
//                           verticalPadding: 8,
//                           ContainerColor: Colors.green,
//                           HaveIcon: false,
//                           btnText: "BuyNow",
//                           borderRadius: 10,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
                      
//                     ],
//                   );
//                 }),
//               ),
//             ),
   
//           ],
//         );
//       }),
//     );
//   }
// }
