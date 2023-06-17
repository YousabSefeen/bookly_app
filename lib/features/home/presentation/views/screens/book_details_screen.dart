import 'package:bookly/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_routers.dart';

class BookDetailsScreen extends StatelessWidget {
  static const route = 'BookDetailsScreen';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: IconButton(
              onPressed: () => AppRouters.pop(context),
              icon: const Icon(FontAwesomeIcons.x, size: 20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartShopping, size: 20),
              ),
            ),
          ],
        ),
        body: const SafeArea(
          child: BookDetailsBody(),
        ),
      ),
    );
  }
}
