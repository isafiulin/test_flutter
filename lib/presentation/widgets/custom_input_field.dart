import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({required this.controller, super.key});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(38))),
      ),
      controller: controller,
    );
  }
}
