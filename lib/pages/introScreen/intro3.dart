import 'package:drop_time/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro3 extends StatefulWidget {
  const Intro3({super.key});

  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("img/intro/Intro3Background.png"))),
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
                      "Use Free Data\nSet Timer On Download\nBy Using ",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Auto Download",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Feature",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("img/intro/Chrome.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/Firefox.png"),
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage("img/intro/Opera.png"),
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      // fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                      image: AssetImage("img/intro/intro3.jpg"),
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
                        final perf = await SharedPreferences.getInstance();
                        perf.setBool("ShowHome", true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
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
            ],
          ),
        ));
  }
}
