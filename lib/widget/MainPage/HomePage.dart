import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 212, 212),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 15, 12, 0),
          child: Container(
              height: MediaQuery.of(context).size.width * 5,
              width: MediaQuery.of(context).size.width * 08,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Time Saving",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18),
                  ),
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(13),
                        elevation: 25,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                              children: const [
                                Image(
                                    height: 70,
                                    image: AssetImage(
                                      'img/home/sharing.png',
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Auto Sharing",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(13),
                        elevation: 25,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                              children: const [
                                Image(
                                    height: 70,
                                    image: AssetImage(
                                      'img/home/Download.png',
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Auto Download",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(13),
                        elevation: 25,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                              children: const [
                                Image(
                                    height: 90,
                                    image: AssetImage(
                                      'img/home/Notification.png',
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Automate Notification bar",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tecniques",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(13),
                        elevation: 25,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                              children: const [
                                Image(
                                    height: 70,
                                    image: AssetImage(
                                      'img/home/Pomodoro.png',
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Pomodoro",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(13),
                        elevation: 25,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                              children: const [
                                Image(
                                    height: 70,
                                    image: AssetImage(
                                      'img/home/Money.png',
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Money Management",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
