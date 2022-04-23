import 'package:lcu_crown/widgets/person_button.dart';
import 'package:flutter/material.dart';

import '../widgets/person_button_2.dart';

class Mr extends StatelessWidget {
  const Mr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mr Lead City",
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
                    "Select your vote for Mr Lead City...",
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
                      person2(
                        name2: "JD Oyewole",
                        study: 'Business Admin',
                        profile: "assets/images/masc1.jpg",
                      ),
                      person2(
                        name2: "Ayo Egunyomi",
                        study: 'Physics with Electronics',
                        profile: "assets/images/masc2.jpg",
                      ),
                      person2(
                        name2: "Dere Amaju",
                        study: 'International Relations',
                        profile: "assets/images/masc3.jpg",
                      ),
                      person2(
                        name2: "Caleb Adejare",
                        study: 'IRPM',
                        profile: "assets/images/masc4.jpg",
                      ),
                    ],
                  ),
                ),
                Column(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
