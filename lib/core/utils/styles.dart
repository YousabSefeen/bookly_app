import 'package:flutter/material.dart';

abstract class Styles {
  static const kGTSectraFine = 'GT Sectra Fine';
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, //regular
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, //regular
  );
  static const textStyle20a = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, fontFamily: kGTSectraFine);
  static const textStyle20b = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    //fontFamily  by default
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    fontFamily: kGTSectraFine,
  );
}
