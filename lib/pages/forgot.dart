import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_time/widget/MainPage/HomePage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../home.dart';
import '../utils/utils.dart';
import '../widget/roundbutton.dart';
import 'login.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FireStroe = FirebaseFirestore.instance.collection('reLoginData');
GlobalKey<FormState> formKey = GlobalKey<FormState>();
final password = TextEditingController();
final email = TextEditingController();
bool loading = false;
final DateTime now = DateTime.now();
final dateFormat = DateFormat('dd-MM-yyyy h:mm:ss a').format(now);

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 70, 30, 0),
              child: Image.asset('img/Forgot.png'),
              height: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'Forgot Password',
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
                    RoundButton(
                      title: ' Forgot Password ',
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
                          "I have Remember  Password?",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          child: Text(
                            ' Sing In',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
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
