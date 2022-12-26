import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_time/pages/login.dart';
import 'package:drop_time/utils/utils.dart';
import 'package:drop_time/widget/roundbutton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingUpPage extends StatefulWidget {
  SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FireStroe = FirebaseFirestore.instance.collection('createAccount');
final name = TextEditingController();
final email = TextEditingController();
final number = TextEditingController();
final password = TextEditingController();
final dob = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
bool nextPage = false;
bool loading = false;

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 70, 30, 0),
              child: Image.asset('img/singUp.png'),
              height: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Create  Account',
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
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 8, 8, 8)),
                        hintText: "Enter your Name",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 231, 231),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Name";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: dob,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: Icon(Icons.date_range,
                            color: Color.fromARGB(255, 8, 8, 8)),
                        hintText: "Enter your Name",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 231, 231),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Name";
                        }
                      },
                    ),
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
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5),
                        ),
                        prefixIcon: Icon(Icons.numbers,
                            color: Color.fromARGB(255, 8, 8, 8)),
                        hintText: "Enter Your Number",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 231, 231, 231),
                      ),
                      validator: (val) {
                        if (val!.length != 10) {
                          return 'Enter 10 Digit Number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
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
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                      title: 'Create Account',
                      loading: loading,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: email.text.toString(),
                                  password: password.text.toString())
                              .then((value) {
                            setState(() {
                              loading = false;
                            });

                            FireStroe.doc(email.text).set({
                              'name': name.text,
                              'email': email.text,
                              'number': number.text,
                              'password': password.text,
                              'Time': dateFormat,
                              'dob': dob.text
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }).onError((error, stackTrace) {
                            Utils().toastMassage(error.toString());
                            setState(() {
                              loading = false;
                            });
                          });

                          nextPage = true;
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
                          'Already Have An Account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          child: Text(
                            ' Sing in',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                          onTap: (() {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false);
                          }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
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
