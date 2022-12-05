import 'package:asbezaye/MerchantsPage/PostItemsScreen.dart';
import 'package:asbezaye/Models/Cart_model.dart';
import 'package:asbezaye/Screens/HomeScreen.dart';
import 'package:asbezaye/Screens/SignIn.dart';
import 'package:asbezaye/Screens/SignUP.dart';
import 'package:asbezaye/Widgets/IntroScreenWidget.dart';
import 'package:asbezaye/Screens/LandingScreen.dart';
import 'package:asbezaye/Screens/SplashScreen.dart';
import 'package:asbezaye/Widgets/button_widget.dart';
import 'package:asbezaye/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'Screens/CartScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthService().handleAuthState(),
        // home: PostItemsScreen(),
      ),
    ));
  }
}