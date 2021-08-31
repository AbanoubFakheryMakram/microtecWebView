
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_localization.dart';

extension appSize on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get sp => ScreenUtil().setSp(this);
}

double get screenWidth => ScreenUtil().screenWidth;
double get screenHeight => ScreenUtil().screenHeight;

extension translateString on String {
  String tr(BuildContext context) {
    return AppLocalization.of(context).translate(this);
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}