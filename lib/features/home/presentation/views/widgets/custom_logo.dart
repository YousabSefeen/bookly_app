import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(pi / 180 * -11),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        'BoOKly',
        style: GoogleFonts.raleway(
          fontSize: 28.sp,
          color: Colors.white,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
