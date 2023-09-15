import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
      ),
      onPressed: onPressed,
      child: Text(
        'Back',
        style: TextStyle(
          color: Colors.white,
          fontSize: 19.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
