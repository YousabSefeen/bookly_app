import 'package:flutter/material.dart';
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
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
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
                size: deviceSize.width * 0.06,
              ),
            ),
          ),
        ),
        style: AppStyles.textStyle18,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.blue, width: 1));
  }
}
