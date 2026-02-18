import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.keybordType,
    this.validator,
    this.controller,
  });
  final String hint;
  final TextInputType? keybordType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keybordType,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(hintText: hint),
      validator: validator,
      controller: controller,
    );
  }
}
