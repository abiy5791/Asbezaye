import 'package:asbezaye/Screens/SignUP.dart';
import 'package:asbezaye/Widgets/TextWidget.dart';
import 'package:asbezaye/Widgets/button_widget.dart';
import 'package:asbezaye/Widgets/textFieldWidget.dart';
import 'package:asbezaye/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../Widgets/GradientButtonWidget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future signin() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim());
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/logo/Grey & Green Elegant Minimal Good Taste Food Restaurant Logo (4).png")),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: _emailController,
                      InputColor: Colors.black,
                      obscureText: false,
                      hintText: "example@gmail.com",
                      hintColor: Colors.black38,
                      labelText: "Email",
                      labelColor: Colors.purple,
                      BorderRadiusSize: 10,
                      NormalborderColor: Color.fromARGB(255, 240, 157, 255),
                      FocusborderColor: Color.fromARGB(255, 255, 196, 0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: _passwordController,
                      InputColor: Colors.black,
                      obscureText: true,
                      hintText: "Password",
                      hintColor: Colors.black38,
                      labelText: "Password",
                      labelColor: Colors.purple,
                      BorderRadiusSize: 10,
                      NormalborderColor: Color.fromARGB(255, 240, 157, 255),
                      FocusborderColor: Color.fromARGB(255, 255, 196, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {},
                child: GradientButtonWidget(
                    text: "Sign In",
                    textColor: Colors.white,
                    gradientColor1: Colors.cyan,
                    gradientColor2: Colors.purple,
                    fontSize: 18,
                    borderRadiusSize: 10,
                    Vertical_Paddingsize: 13,
                    Horizontal_paddingsize: 20,
                    Begin_gradientAlignment: Alignment.topLeft,
                    End_gradientAlignment: Alignment.bottomRight),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogle();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "sign in with google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    Textdecoration: TextDecoration.none,
                    text: "Don't have an account ? ",
                    textColor: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: SignUp(), type: PageTransitionType.fade),
                          (route) => false);
                    },
                    child: TextWidget(
                        text: "Sign Up",
                        textColor: Colors.cyan,
                        Textdecoration: TextDecoration.underline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
