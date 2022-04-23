import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //check this out

    //final Function(String) onChange;
    //var onChange;
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
            //onChanged: widget.onChange,
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  widget.icon,
                  size: 26,
                  color: Color(0xFF2A3299),
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
