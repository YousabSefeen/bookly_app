import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({required this.errorMessage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(
          errorMessage,
          style: AppStyles.textStyle18.copyWith(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
