import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get verticalSpace => SizedBox(
        height: toDouble(),
      );
  SizedBox get horizontalSpace => SizedBox(
        width: toDouble(),
      );

  EdgeInsets get symetricVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get symetricHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingOnlyRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get paddingOnlyLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingOnlyTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingOnlyBottom => EdgeInsets.only(bottom: toDouble());
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
}
