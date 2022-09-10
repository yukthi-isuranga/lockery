import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class receiveDetails extends StatefulWidget {
  receiveDetails({Key? key}) : super(key: key);

  @override
  State<receiveDetails> createState() => _receiveDetailsState();
}

class _receiveDetailsState extends State<receiveDetails> {
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
              SizedBox(
                height: width * 0.05,
              ),
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.yellow,
                child: Text(
                  "Recive Details",
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
                              "Sign In", //South Eastern University of Sri Lanka
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: width * 0.05,
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 72.0),
                              title: Text('Your Locker Details'),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(Icons.open_in_full),
                              isThreeLine: true,
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 72.0),
                              title: Text('Your Locker Details'),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(Icons.open_in_full),
                              isThreeLine: true,
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 72.0),
                              title: Text('Your Locker Details'),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(Icons.open_in_full),
                              isThreeLine: true,
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 72.0),
                              title: Text('Your Locker Details'),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(Icons.open_in_full),
                              isThreeLine: true,
                            ),
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
            ],
          )),
        )
      ],
    ));
  }
}
