import 'package:flutter/material.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_app/core/constants/images_app.dart';
import 'package:green_app/core/functions/navigations.dart';
import 'package:green_app/features/intro/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // delay for 3 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      pushReplacement(context, WelcomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Center(child: SvgPicture.asset(AppImages.logoSvg, width: 250)),
    );
  }
}
