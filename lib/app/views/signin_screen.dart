import 'package:flutter/material.dart';
import 'package:gatherlens/app/routes/app_routes.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/custom_padding.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/widgets/app_spacing.dart';
import 'package:gatherlens/app/widgets/app_textfields.dart';
import 'package:gatherlens/app/widgets/apptext.dart';
import 'package:gatherlens/app/widgets/custom_buttons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: SymetricPadding(
        v: 0,
        h: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSpacing(v: 20),

            AppTextSemiBold(text: 'Hi welcome to gatherLens 🖐', fontSize: 18),
            const AppSpacing(v: 10),

            AppTextSemiBold(
                text: ' Sign in with your email and password', fontSize: 12),
            const AppSpacing(v: 30),
            // enter email
            Authtextfield(
              hintext: 'kunleojo@gmail.com',
              obscureText: false,
              controller: emailcontroller,
              label: 'Email',
            ),
            const AppSpacing(v: 20),
            // enter password
            Authtextfield(
                hintext: 'Enter your password',
                obscureText: false,
                controller: passwordcontroller,
                label: 'Password'),

            const AppSpacing(v: 30),

            LargeButon(label: 'Sign up', ontap: () {}),
            const AppSpacing(v: 30),

            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextSemiBold(
                    text: "Don't have an account?",
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 6),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    child: AppTextBold(
                      text: 'Sign up',
                      fontSize: 14,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
