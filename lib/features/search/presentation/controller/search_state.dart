import 'package:equatable/equatable.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/models/home_model.dart';

class SearchStates extends Equatable {
  final List<HomeModel> searchBooks;
  final String searchBooksErrorMessage;
  final RequestState searchBooksState;

  const SearchStates({
    this.searchBooks = const [],
    this.searchBooksState = RequestState.loaded,
    this.searchBooksErrorMessage = '',
  });

  SearchStates copyWith({
    List<HomeModel>? searchBooks,
    String? searchBooksErrorMessage,
    RequestState? searchBooksState,
  }) {
    return SearchStates(
      searchBooks: searchBooks ?? this.searchBooks,
      searchBooksState: searchBooksState ?? this.searchBooksState,
      searchBooksErrorMessage:
          searchBooksErrorMessage ?? this.searchBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        searchBooks,
        searchBooksErrorMessage,
        searchBooksState,
      ];
}
