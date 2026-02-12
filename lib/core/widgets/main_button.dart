import 'package:flutter/material.dart';
import 'package:green_app/core/styles/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
