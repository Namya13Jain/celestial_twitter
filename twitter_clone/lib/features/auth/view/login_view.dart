//we can't have any api folder file imported here
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallet.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //this is done to ensure that when the app rebuilds then appbar is also not shown
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //this is for disposing the widget
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsConstsnts.backimgpng), fit: BoxFit.fill),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //textfield 1
                  AuthField(
                    controller: emailController,
                    hintText: 'Email address',
                  ),
                  //spacing
                  const SizedBox(
                    height: 25,
                  ),
                  //textfield 2
                  AuthField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  //Spaing
                  const SizedBox(
                    height: 40,
                  ),
                  //button
                  Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: () {},
                      label: "Done",
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,
                    ),
                  ),
                  //Spaing
                  const SizedBox(
                    height: 40,
                  ),
                  //textspan
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                          color: Pallete.whiteColor, fontSize: 16),
                      children: [
                        TextSpan(
                            text: ' Sign Up',
                            style: const TextStyle(
                                color: Pallete.whiteColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, SignUpView.route());
                              }),
                      ],
                    ),
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
