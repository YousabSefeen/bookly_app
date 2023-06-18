import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presentation/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_field.dart';
import '../widgets/search_result_list_view.dart';

class SearchScreen extends StatefulWidget {
  static const route = 'SearchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _key = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomField(
                controller: _controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter a search value.';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  _submit();
                },
                iconOnPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Text('Search Result', style: AppStyles.textStyle18),
              ),
              const Expanded(
                child: SearchResultListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      AppRouters.go(context: context, route: BookDetailsScreen.route);
    } else {
      return;
    }
  }
}
