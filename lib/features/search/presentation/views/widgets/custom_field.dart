import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomField extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final void Function()? iconOnPressed;

  const CustomField({
    required this.controller,
    required this.validator,
    required this.onFieldSubmitted,
    required this.iconOnPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          enabledBorder: customBorder(),
          border: customBorder(),
          focusedBorder: customBorder(),
          hintText: 'Search...',
          hintStyle: AppStyles.textStyle15,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              onPressed: iconOnPressed,
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20.sp,
              ),
            ),
          ),
        ),
        style: AppStyles.textStyle17,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2));
  }
}
