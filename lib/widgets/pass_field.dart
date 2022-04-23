// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class PassField extends StatefulWidget {
  const PassField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,

    //required this.opp,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  final passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    //check this ou

    //bool opp = true;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  widget.icon,
                  size: 26,
                  color: Color(0xFF2A3299),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IconButton(
                  onPressed: () {
                    _toggle();
                  },
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  iconSize: 26,
                  color: Colors.grey[700],
                ),
              ),
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 18),
            ),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
          ),
        ),
      ),
    );
  }
}
