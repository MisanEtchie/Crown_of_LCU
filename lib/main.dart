import 'package:lcu_crown/screens/login.dart';
import 'package:lcu_crown/screens/menu.dart';
import 'package:lcu_crown/screens/misslcu.dart';
import 'package:lcu_crown/screens/mrlcu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lcu_crown/screens/voted.dart';

import 'screens/welcomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyApp(),
        '/LogIn': (context) => LogIn(),
        '/Miss': (context) => Miss(),
        '/Menu': (context) => Menu(
              name: "",
              name2: "",
              //done: false,
            ),

        '/Mr': (context) => Mr(),
        //'/Voted': (context) => Voted(),
      },
    );
  }
}
