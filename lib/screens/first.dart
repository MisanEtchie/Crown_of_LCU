import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lcu_crown/screens/login.dart';
import 'package:lcu_crown/screens/menu.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return Menu(
        name: "",
        name2: "",
      );
    } else {
      return LogIn();
    }
  }
}
