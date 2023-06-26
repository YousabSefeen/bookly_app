import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';
import 'free_books_state.dart';

class FreeBooksCubit extends Cubit<FreeBooksStates> {
  final HomeRepository homeRepository;

  FreeBooksCubit({
    required this.homeRepository,
  }) : super(const FreeBooksStates());

  FutureOr<void> fetchFreeBooks() async {
    final result = await homeRepository.fetchFreeBooks();
    result.fold(
      (failure) => emit(
        state.copyWith(
          programmingBooksState: RequestState.failure,
          programmingBooksErrorMessage: failure.errorMessage,
        ),
      ),
      (programmingBooks) => emit(
        state.copyWith(
          programmingBooksState: RequestState.loaded,
          programmingBooks: programmingBooks,
        ),
      ),
    );
  }
}
