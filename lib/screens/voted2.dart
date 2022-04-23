import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lcu_crown/screens/menu.dart';

class Voted2 extends StatefulWidget {
  final String name2;
  final String profile;
  Voted2(this.name2, this.profile);

  @override
  State<Voted2> createState() => _Voted2State();
}

class _Voted2State extends State<Voted2> {
  late ConfettiController confetti;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confetti = new ConfettiController(
      duration: Duration(seconds: 10000),
    );
    confetti.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confetti.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: confetti,
                    blastDirectionality: BlastDirectionality.explosive,
                    numberOfParticles: 25,
                    shouldLoop: true,
                    colors: [
                      Colors.blue,
                      Color(0xFF2A3299),
                      Colors.pink,
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Container(
                                child: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 70,
                                ),
                                height: 150,
                                width: 150,
                                //color: Colors.blue,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.profile),
                                ),
                                //color: Colors.pink,
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "You voted for ${widget.name2}!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF2A3299),
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(36),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFF2A3299)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Menu(
                                name2: widget.name2,
                                name: "", //done: true,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
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
