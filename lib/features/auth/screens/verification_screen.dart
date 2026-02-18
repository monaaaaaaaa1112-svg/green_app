import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:green_app/core/styles/text_style.dart';
import 'package:green_app/core/functions/navigations.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();

  bool canResend = false;
  int secondsRemaining = 90; // 1:30 دقيقة

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
        startTimer();
      } else {
        setState(() {
          canResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter verification code",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("We have sent SMS to: 01XXXXXXXXXX"),
                const SizedBox(height: 20),

                // Pinput widget
                Pinput(
                  length: 6,
                  controller: _pinController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the code";
                    } else if (value.length < 6) {
                      return "Code must be 6 digits";
                    }
                    return null;
                  },
                  onCompleted: (pin) {
                    print("Entered PIN: $pin");
                  },
                ),

                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // هنا تكتبي كود تغيير الرقم
                  },
                  child: const Text("Change Phone Number"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(
                        "Confirm pressed with code: ${_pinController.text}",
                      );
                      // هنا تكتبي كود التأكيد أو التنقل للشاشة التالية
                    }
                  },
                  child: const Text("Confirm"),
                ),

                const SizedBox(height: 20),

                canResend
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            secondsRemaining = 90;
                            canResend = false;
                            startTimer();
                          });
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(color: Colors.orange),
                        ),
                      )
                    : Text(
                        "Resend confirmation code (${secondsRemaining ~/ 60}:${(secondsRemaining % 60).toString().padLeft(2, '0')})",
                        style: TextStyles.caption1,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
