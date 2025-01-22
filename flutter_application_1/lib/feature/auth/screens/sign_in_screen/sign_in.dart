import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/mixins/app_notice.dart';
import 'package:flutter_application_1/core/resource/app_assets.dart';
import 'package:flutter_application_1/core/resource/extensions/context_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_colors.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';
import 'package:flutter_application_1/core/services/shared_prefs.dart';
import 'package:flutter_application_1/feature/auth/screens/auth_button.dart';
import 'package:flutter_application_1/feature/auth/screens/auth_text_field.dart';
import 'package:flutter_application_1/feature/auth/screens/sign_in_screen/sign_up.dart';
import 'package:flutter_application_1/feature/home/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with AppNotice {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _prefs = SharedPrefs();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Sign In",
                style: AppTextstyle.regular.setSize(48),
              ),
              100.verticalSpace,
              AuthTextField(
                  title: "EMAIL OR PHONE",
                  hint: "Loremipsum@gmail.com",
                  controller: _loginController),
              AuthTextField(
                  title: "PASSWORD",
                  hint: "********",
                  controller: _passwordController),
              20.verticalSpace,
              const Text("Forgot password"),
              40.verticalSpace,
              InkWell(
                onTap: () async {
                  final login = await _prefs.read(key: StorageKey.login);
                  final password = await _prefs.read(key: StorageKey.password);
                  if (login == _loginController.text &&
                      password == _passwordController.text) {
                    showSucces(message: "SUCCESSFUL ENTRY");
                    context.push(
                      const HomeScreen(),
                    );
                  } else {
                    showError(errorText: "ERROR AUTHORISATION");
                  }
                },
                child: Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: SizedBox(
                      child: Text(
                        "Log In",
                        style: AppTextstyle.semiBold
                            .setSize(20)
                            .copyWith(color: AppColors.textColor),
                      ),
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              const Center(child: Text("OR")),
              15.verticalSpace,
              AuthButton(
                text: "Continue With Google",
                image: Image.asset(AppAssets.chrome),
              ),
              10.verticalSpace,
              AuthButton(
                text: "Continue With Facebook",
                image: Image.asset(AppAssets.facebook),
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Don’t Have an account yet?",
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      " SIGN UP",
                      style: TextStyle(
                          color: Color(0xffFCC21B),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
