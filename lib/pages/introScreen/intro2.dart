import 'package:drop_time/pages/introScreen/intro3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../login.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("img/intro/Intro2Background.png"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 90, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.asset("img/intro/intro1.png"),
                    Text(
                      "Automate Quick \nAccess Feature Using",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Auto Control",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Feature\nTo Automate",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("img/intro/Silent.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/AirplaneMode.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/MobileData.png"),
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                      image: AssetImage("img/intro/Intro2.jpg"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Intro3()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, elevation: 25)),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                  child: Center(
                    child: TextButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                  )),
            ],
          ),
        ));
  }
}
