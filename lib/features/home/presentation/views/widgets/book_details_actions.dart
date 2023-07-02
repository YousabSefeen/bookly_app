import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookDetailsActions extends StatelessWidget {
  final String previewLink;
  final String saleability;

  const BookDetailsActions(
      {required this.previewLink, required this.saleability, Key? key})
      : super(key: key);

  String get getSaleability {
    if (saleability == 'NOT_FOR_SALE') {
      return 'Not FOR SALE';
    } else {
      return 'FOR SALE';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
              text: getSaleability,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              onPressed: () {}),
        ),
        Expanded(
          child: CustomButton(
              text: 'Free preview',
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              fontSize: 16,
              onPressed: () async {
                final url = Uri.parse(previewLink);
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    // The next line explains how to open the link
                    // with an external browser
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  print('error url');
                  throw Exception('Could not launch $url');
                }
              }),
        ),
      ],
    );
  }
}
