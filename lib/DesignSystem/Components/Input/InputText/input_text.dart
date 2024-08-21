import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  const InputText({
    required this.controller,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  }
  // Expressão regular simples para validação de email
  const emailPattern =
      r'^[^@]+@[^@]+\.[^@]+';
  final regExp = RegExp(emailPattern);

  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}
