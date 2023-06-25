import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repository.dart';
import 'home_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  final HomeRepository homeRepository;

  NewestBooksCubit({required this.homeRepository})
      : super(const NewestBooksStates());

  FutureOr<void> fitchNewestBooks() async {
    final result = await homeRepository.fetchNewestBooks();

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
