import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';
import 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksStates> {
  final HomeRepository homeRepository;

  AllBooksCubit({required this.homeRepository}) : super(const AllBooksStates());

  FutureOr<void> fetchAllBooks() async {
    final result = await homeRepository.fetchAllBooks();

    result.fold(
      (failure) => emit(state.copyWith(
        newestBooksState: RequestState.failure,
        newestBooksErrorMessage: failure.errorMessage,
      )),
      (newestBooks) => emit(state.copyWith(
        newestBooks: newestBooks,
        newestBooksState: RequestState.loading,
      )),
    );
  }
}
