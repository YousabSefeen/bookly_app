import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/search_cubit.dart';
import '../widgets/custom_field.dart';
import '../widgets/search_list_view.dart';

class SearchScreen extends StatefulWidget {
  static const route = 'SearchScreen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _key = GlobalKey<FormState>();
  final controller = TextEditingController();

  _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      SearchCubit.getObject(context).search(
        textSearch: controller.text,
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    return CustomField(
                      controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a search value.';
                        } else {
                          return null;
                        }
                      },
                      onFieldSubmitted: (_) => _submit(context),
                      iconOnPressed: () => _submit(context),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: Text('Search Result',
                        style: AppStyles.textStyle18a.copyWith(
                            fontWeight: FontWeight.w700, letterSpacing: 2)),
                  ),
                  SearchListView(textSearch: controller.text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
