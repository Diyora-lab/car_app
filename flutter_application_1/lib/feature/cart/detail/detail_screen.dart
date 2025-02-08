import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/resource/extensions/int_extension.dart';
import 'package:flutter_application_1/core/resource/extensions/textstyle_extension.dart';
import 'package:flutter_application_1/core/resource/theme/app_textstyle.dart';
import 'package:flutter_application_1/data/car_model.dart';
import 'package:flutter_application_1/feature/cart/detail/widgets/detail_image_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.car, super.key});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        DetailImageWidget(
          car: car,
        ),
        30.verticalSpace,
        Padding(
          padding: 20.symetricHorizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car.brand,
                    style: AppTextstyle.regular.setSize(25),
                  ),
                  Text(
                    "${car.price} \$",
                    style: AppTextstyle.regular
                        .setSize(20)
                        .copyWith(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
        90.verticalSpace,
        Padding(
          padding: 20.symetricHorizontal,
          child: Row(
            children: [
              Text(
                "RENDER",
                style: AppTextstyle.regular.setSize(20),
              ),
            ],
          ),
        ),
        30.verticalSpace,
        Padding(
          padding: 20.symetricHorizontal,
          child: Row(
            children: [
              Image.network(
                "https://pics.harstatic.com/agent/648337.jpg?ts=2021-12-12T20:09:00",
                width: 30,
                height: 30,
              ),
              15.horizontalSpace,
              Text(
                "Lorem Ipsum",
                style: AppTextstyle.regular.setSize(20),
              ),
              120.horizontalSpace,
              const Icon(
                Icons.wechat,
                size: 30,
              ),
              15.horizontalSpace,
              const Icon(
                Icons.call,
                size: 30,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
