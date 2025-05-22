import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.icon,
    this.maxLines,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconButton? icon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: icon,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
      ),
    );
  }
}
