import 'package:asbezaye/Routes/routes.dart';
import 'package:asbezaye/Screens/SignIn.dart';
import 'package:asbezaye/Widgets/GradientButtonWidget.dart';
import 'package:asbezaye/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import '../Widgets/textFieldWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      InputColor: Colors.black,
                      obscureText: false,
                      hintText: "Selman kehan",
                      hintColor: Colors.black38,
                      labelText: "Name",
                      labelColor: Colors.purple,
                      BorderRadiusSize: 10,
                      NormalborderColor: Color.fromARGB(255, 240, 157, 255),
                      FocusborderColor: Color.fromARGB(255, 255, 196, 0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
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
              GradientButtonWidget(
                  text: "Sign Up",
                  textColor: Colors.white,
                  gradientColor1: Colors.purple,
                  gradientColor2: Colors.cyan,
                  fontSize: 18,
                  borderRadiusSize: 10,
                  Vertical_Paddingsize: 13,
                  Horizontal_paddingsize: 20,
                  Begin_gradientAlignment: Alignment.topLeft,
                  End_gradientAlignment: Alignment.bottomRight),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    Textdecoration: TextDecoration.none,
                    text: "Already have an account ? ",
                    textColor: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: SignIn(), type: PageTransitionType.fade),
                          (route) => false);
                    },
                    child: TextWidget(
                        text: "Sign In",
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
  }
}
