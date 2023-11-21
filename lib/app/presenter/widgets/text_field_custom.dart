import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const TextFieldCustom({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: obscureText ? true : false,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
