import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';
import 'programming_books_state.dart';

class ProgrammingBooksCubit extends Cubit<ProgrammingBooksStates> {
  final HomeRepository homeRepository;

  ProgrammingBooksCubit({
    required this.homeRepository,
  }) : super(const ProgrammingBooksStates());

  FutureOr<void> fetchProgrammingBooks() async {
    final result = await homeRepository.fetchProgrammingBooks();
    result.fold(
      (failure) => emit(
        state.copyWith(
          programmingBooksState: RequestState.failure,
          programmingBooksErrorMessage: failure.errorMessage,
        ),
      ),
      (programmingBooks) => emit(
        state.copyWith(
          programmingBooksState: RequestState.loading,
          programmingBooks: programmingBooks,
        ),
      ),
    );
  }
}
