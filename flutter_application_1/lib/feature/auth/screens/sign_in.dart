import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/app_assets.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';
import 'package:flutter_application_1/feature/auth/screens/sign_in_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
              const SizedBox(height: 100),
              Text(
                "EMAIL OR PHONE",
                style: AppTextstyle.regular.setSize(14),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "Loremipsum@gmail.com "),
              ),
              Text(
                "PASSWORD",
                style: AppTextstyle.regular.setSize(14),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "******"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Forgot password"),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Log In"),
              ),
              const Text("OR"),
              SignInButton(
                text: "Continue With Google",
                image: Image.asset(AppAssets.chrome),
              ),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                text: "Continue With Facebook",
                image: Image.asset(AppAssets.facebook),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don’t Have an account yet?",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    " SIGN UP",
                    style: TextStyle(
                        color: Color(0xffFCC21B),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
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
