import 'package:flutter/material.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.47,
      decoration: const BoxDecoration(
        color: Color(0xff2b2d42),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(310),
        ),
      ),
    );
  }
}
