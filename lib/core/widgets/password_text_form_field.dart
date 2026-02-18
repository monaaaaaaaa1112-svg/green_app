import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.hint});
  final String hint;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscureTexte = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureTexte,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureTexte = !obscureTexte;
            });
          },
          icon: Icon(
            obscureTexte ? Icons.visibility_off : Icons.remove_red_eye,
          ),
        ),
      ),
      validator: (input) {
        if (input!.isEmpty) {
          return 'Please enter your password';
        } else if (input.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
