import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  static const route = 'BookDetailsScreen';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details Screen'),
      ),
    );
  }
}
