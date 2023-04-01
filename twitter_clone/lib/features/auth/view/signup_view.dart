import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallet.dart';
import 'package:flutter/gestures.dart';

import '../../../common/loading_page.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
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

  void onSignUp() {
    final res = ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  //if using ref inside build then ref.watch() will work
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsConstsnts.backimgpng),
                    fit: BoxFit.fill),
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
                            onTap: onSignUp,
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
                            text: "Already have an account?",
                            style: const TextStyle(
                                color: Pallete.whiteColor, fontSize: 16),
                            children: [
                              TextSpan(
                                  text: ' Login',
                                  style: const TextStyle(
                                      color: Pallete.whiteColor, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        LoginView.route(),
                                      );
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
