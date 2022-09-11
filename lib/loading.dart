import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Container(
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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image(
                    //   width: width * 0.50,
                    //   height: width * 0.6,
                    //   image: AssetImage('assets/images/logo.png'),
                    //   fit: BoxFit.fill,
                    // ),
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
                    SpinKitThreeBounce(
                      color: Colors.blueGrey,
                      size: width * 0.2,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
