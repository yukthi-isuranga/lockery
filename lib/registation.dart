import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lockery/components/RoundedButton.dart';
import 'package:lockery/components/RoundedPasswordField.dart';
import 'package:lockery/components/RoundedTextInputField.dart';
import 'package:lockery/components/TextFieldContainer.dart';
import 'package:lockery/services/db.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class RegistationPage extends StatefulWidget {
  const RegistationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  var size, height, width;
  var userRoll = 'User';
  var name = "";
  var registationNo = "";
  var email = "";
  var password = "";

  var userDeviceToken;

  void nameSetter(e) {
    setState(() {
      name = e;
    });
  }

  void registationNoSetter(e) {
    setState(() {
      registationNo = e;
    });
  }

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

  void userRollSetter(e) {
    setState(() {
      userRoll = e;
    });
  }

  // List of items in our dropdown menu
  var items = [
    'User',
    'Admin',
  ];

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
                    child:
                        Lottie.asset('assets/images/86974-registration.json'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: height * 0.65,
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
                                hitText: "Name",
                                textIcon:
                                    Icon(Icons.person, color: Colors.amber),
                                onChanged: (e) {
                                  print(e);
                                  nameSetter(e);
                                },
                                // onChanged: (e) {print(e)}
                              ),
                              RoundedTextInputField(
                                hitText: "Registation No:",
                                textIcon:
                                    Icon(Icons.numbers, color: Colors.amber),
                                onChanged: (e) {
                                  print(e);
                                  registationNoSetter(e);
                                },
                                // onChanged: (e) {print(e)}
                              ),
                              RoundedTextInputField(
                                hitText: "email",
                                textIcon:
                                    Icon(Icons.email, color: Colors.amber),
                                onChanged: (e) {
                                  print(e);
                                  emailSetter(e);
                                },
                                // onChanged: (e) {print(e)}
                              ),
                              RoundedTextInputField(
                                hitText: "Password",
                                textIcon:
                                    Icon(Icons.password, color: Colors.amber),
                                onChanged: (e) {
                                  print(e);
                                  passwordSetter(e);
                                },
                                // onChanged: (e) {print(e)}
                              ),
                              TextFieldContainer(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.people, color: Colors.amber),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) => value == null
                                      ? "Select a userRoll"
                                      : null,
                                  // dropdownColor: Colors.blueAccent,
                                  value: userRoll,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      userRoll = newValue!;
                                    });
                                    print(userRoll);
                                  },
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                ),
                              ),
                              RoundedButton(
                                color: Colors.amber,
                                press: () async {
                                  print("password........... :" + password);
                                  print("Register button pressed");

                                  // register(
                                  //   name,
                                  //   registationNo,
                                  //   email,
                                  //   password,
                                  //   userRoll,
                                  //   userDeviceToken,
                                  // );
                                },
                                text: "Register",
                                textColor: Colors.white,
                              ),
                              RoundedButton(
                                color: Colors.amber,
                                press: () async {
                                  Navigator.pop(context);
                                },
                                text: "Back",
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                height: width * 0.05,
                              ),
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
