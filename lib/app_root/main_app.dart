import 'dart:io';
import 'package:flutter/material.dart';
import 'package:green_app/core/styles/themes.dart';
import 'package:green_app/features/intro/screens/splash_screen.dart';

class GreenApp extends StatelessWidget {
  const GreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: child ?? Scaffold(),
        );
      },
      home: SplashScreen(),
    );
  }
}
