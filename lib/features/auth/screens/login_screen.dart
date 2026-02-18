import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_app/core/constants/images_app.dart';
import 'package:green_app/core/functions/navigations.dart';
import 'package:green_app/core/functions/validations.dart';
import 'package:green_app/core/styles/colors.dart';
import 'package:green_app/core/styles/text_style.dart';
import 'package:green_app/core/widgets/custom_text_form_field.dart';
import 'package:green_app/core/widgets/main_button.dart';
import 'package:green_app/features/auth/screens/signUp_screen.dart';
import '../../../core/widgets/password_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: SvgPicture.asset(AppImages.carrotSvg),
                  ),
                  SizedBox(height: 40),
                  Text('login', style: TextStyles.title),
                  SizedBox(height: 14),
                  Text(
                    'Enter your Email and PassWord',
                    style: TextStyles.caption2,
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Email',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  CustomTextFormField(
                    hint: 'Enter@gmail.com',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';

                        /// xxxx@exaple.xxx
                      } else if (!isEmailValid(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    keybordType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Password',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  PasswordTextFormField(hint: '**********'),
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'forget password?',
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  MainButton(
                    text: 'Log in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyles.caption1,
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: TextButton(
                                onPressed: () {
                                  pushReplacement(context, SignUpScreen());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyles.caption1.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
