import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../search/presentation/controller/search_cubit.dart';
import '../../../../search/presentation/views/widgets/custom_field.dart';
import '../../../../search/presentation/views/widgets/search_list_view.dart';
import '../widgets/computer_books_list_view.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_back_ground.dart';
import '../widgets/custom_logo.dart';
import '../widgets/programming_books_images_list_view.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<FormState>();

  bool _isSearching = false;

  final searchController = TextEditingController();

  _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      _switchCaseSearch();
      SearchCubit.getObject(context).search(
        textSearch: searchController.text,
      );
    } else {
      return;
    }
  }

  _switchCaseSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    const CustomBackGround(),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomLogo(),
                          Builder(
                            builder: (context) {
                              return Form(
                                key: _key,
                                child: CustomField(
                                  controller: searchController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter a search value.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onFieldSubmitted: (_) => _submit(context),
                                  iconOnPressed: () => _submit(context),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          homeBody(isSearching: _isSearching),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Column homeBody({required bool isSearching}) {
    if (isSearching) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _switchCaseSearch();
              searchController.text = '';
            },
          ),
          const SizedBox(height: 20),
          Text('Research Results', style: AppStyles.textStyle17),
          SearchListView(textSearch: searchController.text)
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProgrammingBooksImagesListView(),
          SizedBox(height: 30.h),
          Text('Computer Science Books', style: AppStyles.textStyle17),
          const ComputerBooksListView(),
        ],
      );
    }
  }
}
