import 'package:flutter/material.dart';
import 'package:lcu_crown/net/firebase.dart';
import 'package:lcu_crown/screens/voted2.dart';

import '../screens/voted.dart';

class person2 extends StatefulWidget {
  final String name2;
  final String study;
  final String profile;
  const person2(
      {Key? key,
      required this.name2,
      required this.study,
      required this.profile})
      : super(key: key);

  @override
  State<person2> createState() => _personState();
}

class _personState extends State<person2> {
  @override
  Widget build(BuildContext context) {
    //final name = ModalRoute.of(context)!.settings.arguments, String;
    return Container(
      margin: EdgeInsets.only(bottom: 36),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    //color: Colors.pink,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.profile),
                      ),
                      //borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name2,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.study,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF2A3299),
                    ),
                    child: TextButton(
                      onPressed: () {
                        person_details(context);
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.pink,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sure(context,
                              name2: widget.name2,
                              profile: widget.profile,
                              name: '');
                        });
                      },
                      child: Text(
                        "Vote",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 2.0
            //offset: Offset(7, 7)
            ,
          ),
        ],
      ),
    );
  }

  Future<dynamic> person_details(BuildContext context) {
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
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage(widget.profile),
                  ),
                ),
                radius: MediaQuery.of(context).size.width * 0.15,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    widget.name2,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.study,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consec adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.pink,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                    setState(() {
                      sure(context,
                          name2: widget.name2,
                          profile: widget.profile,
                          name: '');
                    });
                  },
                  child: Text(
                    "Vote",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.height,
            )
          ],
        );
      },
    );
  }

  Future<dynamic> sure(BuildContext context,
      {required String name, required String profile, required String name2}) {
    //final String name;
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
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "You can only vote once",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "Are you sure you want to vote for "),
                              TextSpan(
                                text: "$name2",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: "?")
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.pink,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            updateUser2(mr: name2);
                            Navigator.pop(context, true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Voted2(name2, profile)),
                            );
                          },
                          child: Text(
                            "Vote",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
