import 'package:drop_time/pages/introScreen/intro2.dart';
import 'package:drop_time/pages/login.dart';
import 'package:drop_time/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("img/intro/Intro1Background.png"))),
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
                      "Set Timer On \nThe Message To Be \nSent Using",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Auto Sharing",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Feature With",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("img/intro/Whatsapp.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/SMS.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/Telegram.png"),
                          height: 40,
                        ),
                      ],
                    ),
                    Image(
                      height: 230,
                      image: AssetImage("img/intro/intro1.jpg"),
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
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Intro2()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Text(
                          "Next",
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
