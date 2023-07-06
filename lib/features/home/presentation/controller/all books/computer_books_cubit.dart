import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';
import 'computer_books_state.dart';

class ComputerBooksCubit extends Cubit<ComputerBooksStates> {
  final HomeRepository homeRepository;

  ComputerBooksCubit({required this.homeRepository})
      : super(const ComputerBooksStates());

  FutureOr<void> fetchComputerBooks() async {
    final result = await homeRepository.fetchComputerBooks();

    result.fold(
      (failure) => emit(state.copyWith(
        computerBooksState: RequestState.failure,
        computerBooksErrorMessage: failure.errorMessage,
      )),
      (computerBooks) => emit(state.copyWith(
        computerBooks: computerBooks,
        computerBooksState: RequestState.loaded,
      )),
    );
  }
}
