import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({required this.text, required this.image, super.key});
  final String text;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            child: image,
          ),
          Text(
            text,
            style: AppTextstyle.regular.setSize(14),
          ),
        ],
      ),
    );
  }
}
