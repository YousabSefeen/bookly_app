import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const kGTSectraFine = 'GT Sectra Fine';
  static TextStyle textStyle17 = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle textStyle13 = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400, //regular
      color: Colors.white);

  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,

    fontWeight: FontWeight.w500, //Medium
  );
  static TextStyle textStyle18a = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: kGTSectraFine,
  );

  static TextStyle textStyle30 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    fontFamily: kGTSectraFine,
  );
}
