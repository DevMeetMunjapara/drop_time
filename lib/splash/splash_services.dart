import 'package:drop_time/pages/login.dart';
import 'package:drop_time/home.dart';
import 'package:drop_time/widget/MainPage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
