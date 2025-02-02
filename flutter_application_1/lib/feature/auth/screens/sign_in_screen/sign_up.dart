import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/app_assets.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_colors.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';
import 'package:flutter_application_1/core/services/shared_prefs.dart';
import 'package:flutter_application_1/feature/auth/screens/auth_button.dart';
import 'package:flutter_application_1/feature/auth/screens/auth_text_field.dart';
import 'package:flutter_application_1/feature/auth/screens/sign_in_screen/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final _pref = SharedPrefs();

  @override
  void dispose() {
    _nameController.dispose();
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
                "Sign Up",
                style: AppTextstyle.regular.setSize(48),
              ),
              100.verticalSpace,
              AuthTextField(
                  title: "ENTER YOUR NAME",
                  hint: "FULL NAME",
                  controller: _nameController),
              20.verticalSpace,
              AuthTextField(
                  title: "EMAIL OR PHONE",
                  hint: "Loremipsum@gmail.com",
                  controller: _loginController),
              20.verticalSpace,
              AuthTextField(
                  title: "PASSWORD",
                  hint: "*******",
                  controller: _passwordController),
              40.verticalSpace,
              InkWell(
                onTap: () {
                  _pref.save(
                      key: StorageKey.login, value: _loginController.text);
                  _pref.save(
                      key: StorageKey.password,
                      value: _passwordController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
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
                        "Sign Up",
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
            ],
          ),
        ),
      ),
    );
  }
}
