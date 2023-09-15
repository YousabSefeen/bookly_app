import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common presentation/screens/book_details_screen.dart';
import '../../../../../core/common presentation/widgets/custom_error_widget.dart';
import '../../../../../core/common presentation/widgets/horizontal_custom_loading.dart';
import '../../../../../core/enums/request_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../controller/programming books/programming_books_cubit.dart';
import '../../controller/programming books/programming_books_state.dart';
import 'custom_image.dart';

class ProgrammingBooksImagesListView extends StatelessWidget {
  const ProgrammingBooksImagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgrammingBooksCubit, ProgrammingBooksStates>(
      buildWhen: (previous, current) =>
          previous.programmingBooksState != current.programmingBooksState,
      builder: (context, state) {
        switch (state.programmingBooksState) {
          case RequestState.loading:
            return const HorizontalCustomLoading();
          case RequestState.loaded:
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.22,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.programmingBooks.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 115,
                    child: GestureDetector(
                      onTap: () {
                        AppRouters.go(
                          context: context,
                          route: BookDetailsScreen.route,
                          arguments: state.programmingBooks[index],
                        );
                      },
                      child: CustomImage(
                        imageUrl: state.programmingBooks[index].volumeInfoModel
                                .imageLinksModel?.thumbnail ??
                            AppConstants.messi,
                      ),
                    ),
                  ),
                ),
              ),
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.programmingBooksErrorMessage,
            );
        }
      },
    );
  }
}
