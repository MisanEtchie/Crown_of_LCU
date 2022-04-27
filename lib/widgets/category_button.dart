import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    Key? key,
    required this.press,
    required this.num,
    required this.desc,
    required this.name,
  }) : super(key: key);

  final VoidCallback press;
  final int num;
  final String desc;
  String name = "";

  bool hasVoted = false;

  final Stream<QuerySnapshot<Map<String, dynamic>>> users =
      FirebaseFirestore.instance.collection("Users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 36),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          //bool hasvoted
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: users,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return Text(
                            "has error",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            "Loading...",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          );
                        }
                        final data = snapshot.requireData;
                        if ((data.docs[0]["miss"]) == "") {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "No Candidate Selected...",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.people),
                                      ),
                                      Text(
                                        (num).toString() + " candidates",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      child: Center(
                                        child: TextButton(
                                          onPressed: ((hasVoted == false)
                                              ? press
                                              : () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        insetPadding:
                                                            EdgeInsets.all(24),
                                                        contentPadding:
                                                            EdgeInsets.all(12),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        title: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Center(
                                                                child: Column(
                                                              children: [
                                                                Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 40,
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  "Unfortunately, you can only vote once!",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ))),
                                                      );
                                                    },
                                                  );
                                                }),
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color(0xFF2A3299),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        }

                        /*if ((data.docs[0]["mr"]) != "") {
                          hasVoted = true;
                        }*/

                        return Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "You Voted For ${data.docs[0]["miss"]}!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        );
                      }),
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
}
