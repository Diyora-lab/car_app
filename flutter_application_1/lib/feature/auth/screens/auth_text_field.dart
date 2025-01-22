import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {required this.title,
      required this.hint,
      required this.controller,
      super.key});

  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: AppTextstyle.regular.setSize(14),
      ),
      20.verticalSpace,
      TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      )
    ]);
  }
}
