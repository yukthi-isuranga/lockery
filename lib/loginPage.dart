import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lockery/components/RoundedButton.dart';
import 'package:lockery/components/RoundedPasswordField.dart';
import 'package:lockery/components/RoundedTextInputField.dart';
import 'package:lockery/registation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void emailSetter(e) {
    setState(() {
      email = e;
    });
  }

  void passwordSetter(e) {
    setState(() {
      password = e;
    });
  }

  var email = "";
  var password = "";
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // width: 100,
          // height: 100,
          // color: Colors.amber,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset("assets/images/Rectangle top.png")),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/Rectangle bottom.png")),
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.yellow,
                    child: Text(
                      "LOCKERY App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Image(
                  //   width: width * 0.35,
                  //   height: width * 0.4,
                  //   image: AssetImage('assets/images/logo.png'),
                  //   fit: BoxFit.fill,
                  // ),
                  Container(
                    width: width * 0.35,
                    height: width * 0.4,
                    child: Lottie.asset('assets/images/74938-lock-blue.json'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: height * 0.5,
                      width: width * 0.95,
                      color: Colors.grey.withOpacity(0.8),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Column(
                            children: [
                              Text(
                                  "Sign In", //South Eastern University of Sri Lanka
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              RoundedTextInputField(
                                hitText: "Email",
                                textIcon:
                                    Icon(Icons.person, color: Colors.amber),
                                onChanged: (e) {
                                  print(e);
                                  emailSetter(e);
                                  // email = e;
                                },
                                // onChanged: (e) {print(e)}
                              ),
                              RoundedPasswordField(
                                onChanged: (value) {
                                  print(value);
                                  passwordSetter(value);
                                },
                              ),
                              RoundedButton(
                                color: Colors.amber,
                                press: () {},
                                text: "Login",
                                textColor: Colors.white,
                              ),
                              RoundedButton(
                                color: Colors.amber,
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistationPage(
                                                title: "Registation")),
                                  );
                                },
                                text: "Register",
                                textColor: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Text("Developed By"),
                    onTap: () {},
                  )
                ],
              ))
            ],
          )),
    );
  }
}
