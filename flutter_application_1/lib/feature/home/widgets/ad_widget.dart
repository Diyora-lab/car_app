import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/context_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.mq.height / 5,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          left: -10,
          bottom: -5,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          top: (context.mq.height / 5) * 0.30,
          left: 0,
          right: 0,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          right: 45,
          bottom: 35,
          child: Container(
            padding: 34.symetricHorizontal,
            decoration: BoxDecoration(
                color: const Color(0xff988080), borderRadius: 10.borderRadius),
            child: Text(
              "Try now",
              style: AppTextstyle.semiBold
                  .setSize(11)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: (context.mq.height / 5) * 0.60,
          left: 250,
          right: 0,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "30%",
                    style: AppTextstyle.regular
                        .setSize(48)
                        .copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: 20.paddingOnlyLeft,
                    child: Text(
                      "Off",
                      style: AppTextstyle.regular
                          .setSize(48)
                          .copyWith(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THIS JULY',
                    style: AppTextstyle.regular
                        .setSize(22)
                        .copyWith(color: Colors.white),
                  ),
                  6.verticalSpace,
                  Text(
                    "Travel to the end of the world \nthis whole month \ncause we care when you are \nhappy",
                    style: AppTextstyle.regular
                        .setSize(14)
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
