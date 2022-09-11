import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class LockerDetails extends StatefulWidget {
  LockerDetails({Key? key}) : super(key: key);

  @override
  State<LockerDetails> createState() => _LockerDetailsState();
}

class _LockerDetailsState extends State<LockerDetails> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
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
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.yellow,
                child: Text(
                  "Locker Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: width * 0.35,
                height: width * 0.4,
                child: Lottie.asset('assets/images/86974-registration.json'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  // height: height * 0.5,
                  width: width * 0.95,
                  color: Colors.grey.withOpacity(0.8),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Column(
                        children: [
                          Text(
                              "Details", //South Eastern University of Sri Lanka
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: width * 0.05,
                          ),
                          SizedBox(
                            height: height * 0.05,
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
          )),
        )
      ],
    ));
    ;
  }
}
