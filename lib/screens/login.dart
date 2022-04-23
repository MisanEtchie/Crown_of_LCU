import 'package:firebase_auth/firebase_auth.dart';
import 'package:lcu_crown/net/firebase.dart';
import 'package:lcu_crown/screens/menu.dart';
import 'package:lcu_crown/widgets/pass_field.dart';
import 'package:flutter/material.dart';
import 'package:lcu_crown/net/firebase.dart';

import '../widgets/text_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  // final GlobalKey<FormState> _key GlobalKey<FormState>();

  //bool opp = true;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isKey = MediaQuery.of(context).viewInsets.bottom != 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/4142.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
                child: Column(
              children: [
                if (!isKey)
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        "Let's Get Started.",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF2A3299),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Login using your matric number",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(
                            0xFF2A3299,
                          ),
                          width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: TextField(
                        //onChanged: widget.onChange,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              Icons.person,
                              size: 26,
                              color: Color(0xFF2A3299),
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Matric Number',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                /*PassField(
                    icon: Icons.lock,
                    hint: 'PASSWORD',
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done),*/
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(
                            0xFF2A3299,
                          ),
                          width: 3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              Icons.lock,
                              size: 26,
                              color: Color(0xFF2A3299),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              iconSize: 26,
                              color: Colors.grey[700],
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 18),
                        ),
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xFF2A3299)),
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: (emailController.text.trim() + "@gmail.com"),
                            password: passwordController.text.trim(),
                          );
                          addUser();
                        } on FirebaseAuthException catch (error) {
                          setState(() {
                            isLoading = false;
                          });
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  insetPadding: EdgeInsets.all(24),
                                  contentPadding: EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Invalid matric number or password. Please double check and try again!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ))),
                                  ],
                                );
                              });
                        }
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushNamed(context, '/Menu');
                      },
                      child: isLoading
                          ? (CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
