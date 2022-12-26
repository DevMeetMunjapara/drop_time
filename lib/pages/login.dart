import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_time/pages/forgot.dart';
import 'package:drop_time/pages/login.dart';
import 'package:drop_time/pages/singUp.dart';
import 'package:drop_time/home.dart';
import 'package:drop_time/utils/utils.dart';
import 'package:drop_time/widget/MainPage/HomePage.dart';
import 'package:drop_time/widget/roundbutton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FireStroe = FirebaseFirestore.instance.collection('reLoginData');
final email = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
final password = TextEditingController();
final DateTime now = DateTime.now();
final dateFormat = DateFormat('dd-MM-yyyy h:mm:ss a').format(now);
bool loading = false;
Random random = new Random();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 70, 30, 0),
              child: Image.asset('img/login.png'),
              height: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Login Now',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: Icon(Icons.email,
                            color: Color.fromARGB(255, 8, 8, 8)),
                        hintText: "Your Email",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 231, 231),
                      ),
                      validator: (val) {
                        final bool emailValied =
                            EmailValidator.validate(email.text.trim());
                        if (emailValied) {
                          return null;
                        } else {
                          return "Enter email e.g abc@email.com";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: Icon(Icons.password,
                            color: Color.fromARGB(255, 8, 8, 8)),
                        hintText: "Create Password",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 231, 231),
                      ),
                      validator: (val) {
                        if (val!.length < 6) {
                          return 'Muxmum 6 Lenth Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgot()));
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 84, 22, 208)),
                        )),
                    RoundButton(
                      title: 'Login',
                      loading: loading,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _auth
                              .signInWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text.toString())
                              .then((value) {
                            setState(() {
                              loading = false;
                            });
                            var sp = ' ';
                            var docId = email.text + sp + dateFormat.toString();
                            FireStroe.doc(docId).set({
                              'email': email.text,
                              'password': password.text,
                              'Time': dateFormat
                            });
                            Utils().toastMassage(value.user!.email.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }).onError((error, stackTrace) {
                            setState(() {
                              loading = false;
                            });
                            debugPrint(error.toString());
                            Utils().toastMassage(error.toString());
                          });
                          int randomNumber = random.nextInt(100);
                        } else {
                          print('error');
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't Have An Account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          child: Text(
                            ' Create Now',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 84, 22, 208)),
                          ),
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingUpPage()));
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
