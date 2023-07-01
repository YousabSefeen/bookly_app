import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';

class SimilarBookCubit extends Cubit<SimilarBooksStates> {
  final HomeRepository homeRepository;

  SimilarBookCubit({required this.homeRepository})
      : super(const SimilarBooksStates());

  FutureOr<void> fetchSimilarBooks({required String category}) async {
    final result = await homeRepository.fetchSimilarBooks(category: category);

    result.fold(
        (failure) => emit(state.copyWith(
              similarBooksState: RequestState.failure,
              similarBooksErrorMessage: failure.errorMessage,
            )),
        (similarBooks) => emit(state.copyWith(
              similarBooks: similarBooks,
              similarBooksState: RequestState.loaded,
            )));
  }
}
