import 'dart:async';

import 'package:bookly/core/enums/request_state.dart';
import 'package:bookly/features/search/presentation/controller/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/search_repository.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepository searchRepository;

  SearchCubit({required this.searchRepository}) : super(const SearchStates());

  static SearchCubit getObject(context) => BlocProvider.of(context);

  FutureOr<void> search({required String textSearch}) async {
    emit(state.copyWith(
      searchBooksState: RequestState.loading,
    ));
    final result = await searchRepository.search(textSearch: textSearch);

    result.fold(
        (failure) => emit(
              state.copyWith(
                searchBooksState: RequestState.failure,
                searchBooksErrorMessage: failure.errorMessage,
              ),
            ),
        (books) => emit(state.copyWith(
              searchBooks: books,
              searchBooksState: RequestState.loaded,
            )));
  }
}
