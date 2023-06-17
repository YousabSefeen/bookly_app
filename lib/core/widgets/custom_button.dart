import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final String text;
  final Color? textColor;
  final double? fontSize;

  const CustomButton({
    required this.borderRadius,
    required this.backgroundColor,
    required this.text,
    this.textColor,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        child: Text(text,
            style: AppStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w900,
              color: textColor,
              fontSize: fontSize,
            )),
      ),
    );
  }
}
