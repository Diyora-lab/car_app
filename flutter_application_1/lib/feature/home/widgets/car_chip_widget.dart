import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';

class CarChipWidget extends StatelessWidget {
  const CarChipWidget({required this.isActive, required this.label, super.key});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(
          color: isActive ? Colors.transparent : const Color(0xff284C59)),
      backgroundColor: isActive ? const Color(0xff2B4C59) : Colors.white,
      label: Text(
        label,
        style: isActive
            ? AppTextstyle.semiBold.setSize(14).copyWith(color: Colors.white)
            : AppTextstyle.regular.setSize(14).copyWith(
                  color: const Color(0xff284C59),
                ),
      ),
    );
  }
}
