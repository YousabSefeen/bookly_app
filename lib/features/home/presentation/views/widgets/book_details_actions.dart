import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookDetailsActions extends StatelessWidget {
  const BookDetailsActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text: '19.99€',
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Free preview',
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
