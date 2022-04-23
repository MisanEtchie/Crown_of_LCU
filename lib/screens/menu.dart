import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lcu_crown/widgets/category_button.dart';
import 'package:lcu_crown/widgets/category_button_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lcu_crown/net/firebase.dart';

import '../widgets/person_button.dart';

class Menu extends StatefulWidget {
  final String name;
  final String name2;

  Menu({
    required this.name,
    required this.name2,
  });

  //final CollectionReference brewCollection Firestore.instance.collection('brews');

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //late bool done;
  @override
  Widget build(BuildContext context) {
    //String info = "Ife";
    bool done;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                //mainAxisAlignment: MainAxisAlignment.start,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        color: Color(0xFF2A3299),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Pick a category to vote from",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      CategoryButton(
                        press: () {
                          Navigator.pushNamed(context, '/Miss');
                        },
                        desc: 'Miss Lead City, 2022',
                        num: 6,
                        name: widget.name,
                        //done: widget.done,
                      ),
                      CategoryButton2(
                        press: () {
                          Navigator.pushNamed(context, '/Mr');
                        },
                        desc: 'Mr Lead City, 2022',
                        num: 4,
                        name2: widget.name2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
