import 'dart:html';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:video_lead/Reusables/buttons.dart';
import 'package:video_lead/screens/login.dart';
//login screen of the app

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future FirebaseSignup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic screenheight =
        MediaQuery.of(context).size.height; //getting screen size of the browser
    dynamic screenwidth =
        MediaQuery.of(context).size.width; //getting screen size of the browser
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: screenheight,
              width: screenwidth / 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 700),
                      child: Image.asset(
                        'Assets/images/logo.png',
                        alignment: Alignment.topLeft,
                        height: 65,
                        width: 65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    "Hello",
                    style: TextStyle(
                        color: Color(0xff111727),
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "To Get started please Sign Up ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 19, 43, 110),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //email text field
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  //password textfield
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  //signup button
                  const SizedBox(height: 30),
                  isLoading
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: 350,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color(0xff111727))),
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  FirebaseSignup();
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              )),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: Color(0xff111727),
                        )),
                  // buttons(
                  //     ButtonHeight: 50,
                  //     ButtonWidth: 460,
                  //     ButtonColour: 0xff111727,
                  //     ButtonFunction: () {
                  //       FirebaseSignIn();
                  //     },
                  //     ButtonText: 'click me',
                  //     ButtonTextColor: 0xffFFFFFF),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "I have an account?  ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 19, 43, 110),
                                )),
                            TextSpan(
                                text: "Log In",
                                style: TextStyle(
                                    color: Color(0xff111727),
                                    fontWeight: FontWeight.bold))
                          ])),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "OR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  //google login button
                  GestureDetector(
                    onTap: (() {}),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Card(
                        elevation: 20,
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image:
                                    AssetImage("Assets/images/googleicon.png"),
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                "Log In with Google",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              height: screenheight,
              width: screenwidth / 2,
            ),
          ),
        ],
      ),
    );
  }
}
