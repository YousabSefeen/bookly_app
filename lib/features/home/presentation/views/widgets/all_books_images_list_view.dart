import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/controller/all%20books/all_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/all%20books/all_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class AllBooksImagesListView extends StatelessWidget {
  const AllBooksImagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return BlocBuilder<AllBooksCubit, AllBooksStates>(
      builder: (context, state) {
        switch (state.allBooksState) {
          case RequestState.loading:
            return const CustomLoadingWidget();
          case RequestState.loaded:
            return SizedBox(
              height: deviceSize.height * 0.22,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.allBooks.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomImage(
                    imageUrl: state.allBooks[index].volumeInfoModel
                        .imageLinksModel.smallThumbnail,
                  ),
                ),
              ),
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.allBooksErrorMessage,
            );
        }
      },
    );
  }
}
