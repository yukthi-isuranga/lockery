import 'package:flutter/material.dart';
import 'package:lockery/services/userMng.dart';
import 'package:lottie/lottie.dart';

class PageNotFound extends StatefulWidget {
  PageNotFound({Key? key}) : super(key: key);

  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("User Sign out clicker.....>>>>");
            UserManagement().signOut();
          },
          child: Icon(Icons.logout),
          splashColor: Colors.purple,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  // 'https://assets5.lottiefiles.com/packages/lf20_zyu0ctqb.json'),
                  'https://assets5.lottiefiles.com/packages/lf20_GIyuXJ.json'),
              const Text(
                'Sorry, we couldn\'t find the page!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: const Color(0xff2f3640),
                ),
              ),
            ],
          ),
        ));
  }
}
