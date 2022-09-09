import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future register(String name, String registationNo, email, password,
    String userRoll, String userDeviceToken) async {
  print("password :" + password);
  // showDialog(
  //     context: context,
  //     builder: (context) => Center(
  //             child: SpinKitFadingCircle(
  //           controller: AnimationController(
  //               vsync: this, duration: const Duration(milliseconds: 1200)),
  //           itemBuilder: (BuildContext context, int index) {
  //             return DecoratedBox(
  //               decoration: BoxDecoration(
  //                 color: index.isEven ? Colors.red : Colors.green,
  //               ),
  //             );
  //           },
  //         )));

  try {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // String? userDeviceToken = await messaging.getToken().toString();
    // String? userDeviceToken = await FirebaseMessaging.instance.getToken();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print("uuuuussssseeeeerrrrr userDeviceToken......" + userDeviceToken);
    String? accYear;
    await DatabaseService(uid: uid.toString()).updateUser(
        name, registationNo, email, userRoll, userDeviceToken, accYear);
  } on FirebaseAuthException catch (e) {
    print(e);

    final snackBar = SnackBar(
      // backgroundColor: Colors.red,
      content: Text(e.message.toString()),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {},
      ),
    );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class DatabaseService {
  final String? uid;
  // final String collectionName;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference notificationAppCollection =
      FirebaseFirestore.instance.collection('users');

  //collection reference for student notifications
  CollectionReference notifications =
      FirebaseFirestore.instance.collection('notifications');

  //notifications ID auto genareted
  String notificationID = FirebaseFirestore.instance
      .collection('notifications')
      .doc("student")
      .collection("firstYear")
      .doc()
      .id;

  Future<void> updateUser(String name, String regNo, String email,
      String userRoll, String userDeviceToken, String? academicYear) async {
    return await notificationAppCollection.doc(uid).set({
      'name': name,
      'registationNo': regNo,
      'email': email,
      "userRoll": userRoll,
      "uid": uid,
      "userDeviceToken": userDeviceToken,
      "academicYear": academicYear
    });
  }

  Future<void> addNotificationToStudents(
      String title, String body, String academicYear) async {
    return await notifications
        .doc("student")
        .collection(academicYear)
        .doc(notificationID)
        .set({
      'notificationTitle': title,
      'notificationBody': body,
      "createdAt": DateTime.now(),
      "notificationID": notificationID,
      "academicYear": academicYear
    });
  }

  Future<void> addNotificationToStaff(String title, String body) async {
    return await notifications
        .doc("staff")
        .collection("notification")
        .doc(notificationID)
        .set({
      'notificationTitle': title,
      'notificationBody': body,
      "createdAt": DateTime.now(),
      "notificationID": notificationID,
    });
  }

  Future<void> editNotificationAllStudents(
      String title, String body, String postID, String year) async {
    return await notifications
        .doc("student")
        .collection(year)
        .doc(postID)
        .update({
      'notificationTitle': title,
      'notificationBody': body,
      // "createdAt": DateTime.now(),
      // "notificationID": notificationID
    });
  }

  Future<void> editNotificationAllStaff(
      String title, String body, String postID) async {
    return await notifications
        .doc("staff")
        .collection("notification")
        .doc(postID)
        .update({
      'notificationTitle': title,
      'notificationBody': body,
      // "createdAt": DateTime.now(),
      // "notificationID": notificationID
    });
  }

  Future<void> deleteNotification(String postID, String year) {
    return notifications.doc("student").collection(year).doc(postID).delete();
  }

  Future<void> deleteStaffNotification(String postID) {
    return notifications
        .doc("staff")
        .collection("notification")
        .doc(postID)
        .delete();
  }
}
