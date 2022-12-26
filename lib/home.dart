import 'package:drop_time/pages/login.dart';
import 'package:drop_time/widget/MainPage/HomePage.dart';
import 'package:drop_time/widget/MainPage/profile.dart';
import 'package:drop_time/widget/MainPage/timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  int Index = 0;
  final pages = [
    HomePage(),
    Timer(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
        title: Text('Drop Time'),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 84, 22, 208),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 85, 0, 255),
          selectedFontSize: 15,
          unselectedItemColor: Colors.black,
          currentIndex: Index,
          onTap: (value) {
            setState(() {
              Index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Schedule & Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: pages[Index],
    );
  }
}
