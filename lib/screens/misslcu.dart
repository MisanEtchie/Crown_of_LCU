import 'package:lcu_crown/widgets/person_button.dart';
import 'package:flutter/material.dart';

class Miss extends StatelessWidget {
  const Miss({Key? key}) : super(key: key);

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
                    "Miss Lead City",
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
                    "Select your vote for Miss Lead City...",
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
                      person(
                        name: "Asa Adegbite",
                        study: 'Microbiology',
                        profile: "assets/images/fem1.jpg",
                      ),
                      person(
                        name: "Ife Jacobs",
                        study: 'Law',
                        profile: "assets/images/fem2.jpg",
                      ),
                      person(
                        name: "Rachel Popoola",
                        study: 'Computer Science',
                        profile: "assets/images/fem3.jpg",
                      ),
                      person(
                        name: "Chisom Usiagwu",
                        study: 'Civil Engineering',
                        profile: "assets/images/fem4.jpg",
                      ),
                      person(
                        name: "Fareedah Bankole",
                        study: 'Mass Communication',
                        profile: "assets/images/fem5.jpg",
                      ),
                      person(
                        name: "Funmi Olarewaju",
                        study: 'Maths Education',
                        profile: "assets/images/fem6.jpg",
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
