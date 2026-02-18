import 'package:flutter/material.dart';
import 'package:green_app/core/functions/navigations.dart';
import 'package:green_app/core/functions/validations.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:green_app/core/styles/text_style.dart';
import 'package:green_app/core/widgets/custom_text_form_field.dart';
import 'package:green_app/core/widgets/main_button.dart';
import 'package:green_app/features/auth/screens/verification_screen.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({super.key});

  @override
  State<EnterNumberScreen> createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter your mobile number', style: TextStyles.title),
                const SizedBox(height: 14),
                Text(
                  'We need to verify you. We will send you a one time verification code.',
                  style: TextStyles.caption2,
                ),
                const SizedBox(height: 36),
                Text(
                  'Mobile Number',
                  style: TextStyles.subtitle.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                CustomTextFormField(
                  hint: '01xxxxxxxxx',
                  controller: phoneController,
                  keybordType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!isEgyptianPhone(value)) {
                      return 'Phone number must be at least 11 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 26),
                MainButton(
                  text: 'Next',
                  onPressed: () {
                    // Navigate to Verification Screen
                    if (formKey.currentState!.validate()) {
                      pushTo(context, OtpScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
