import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class Confetti extends StatefulWidget {
  const Confetti({Key? key}) : super(key: key);

  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  late ConfettiController confetti;

  @override
  void initState() {
    confetti = ConfettiController(duration: Duration(seconds: 1000));
    super.initState();
  }

  @override
  void play() {
    confetti.play();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
