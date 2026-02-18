import 'package:flutter/material.dart';
import 'package:green_app/features/auth/screens/verification_screen.dart';

void pushReplacement(BuildContext context, Widget newScreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

void pushTo(BuildContext context, Widget newScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => newScreen));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
