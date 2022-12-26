import 'package:drop_time/pages/introScreen/intro.dart';
import 'package:drop_time/pages/introScreen/intro1.dart';
import 'package:drop_time/pages/introScreen/intro2.dart';
import 'package:drop_time/pages/introScreen/intro3.dart';
import 'package:drop_time/pages/login.dart';
import 'package:drop_time/pages/singUp.dart';
import 'package:drop_time/splash/splash_screen.dart';
import 'package:drop_time/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isView;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final perf = await SharedPreferences.getInstance();
  final showHome = perf.getBool("ShowHome") ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => showHome ? SplashScreen() : Intro(),
      },
    );
  }
}
