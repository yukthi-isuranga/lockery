import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lockery/adminPage.dart';
import 'package:lockery/pageNotFound.dart';
import 'package:lockery/userPage.dart';

class UserManagement {
  authorizeAccess(BuildContext context) {
    // FirebaseAuth.instance.currentUser
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  routing(userRoll) {
    print(userRoll + ".............................");
    if (userRoll == 'User') {
      return userPage();
    } else if ((userRoll == 'Admin')) {
      return AdminPage();
    } else {
      return PageNotFound();
    }
  }
}
