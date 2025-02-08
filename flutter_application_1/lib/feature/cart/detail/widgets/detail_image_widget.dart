import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/car_filters.dart';
import 'package:flutter_application_1/core/resource/extensions/context_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';
import 'package:flutter_application_1/data/car_model.dart';

class DetailImageWidget extends StatelessWidget {
  const DetailImageWidget({required this.car, super.key});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mq.height / 2,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: car.type.getColor.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: context.mq.height / 10,
          child: Text(
            "TIIRA",
            textAlign: TextAlign.center,
            style: AppTextstyle.regular
                .setSize(160)
                .copyWith(color: Colors.white.withOpacity(0.44)),
          ),
        ),
        Positioned(
            right: 0, left: 0, bottom: 0, child: Image.network(car.image)),
        SafeArea(
          child: Padding(
            padding: 20.paddingOnlyLeft,
            child: BackButton(
              style: ElevatedButton.styleFrom(iconColor: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
