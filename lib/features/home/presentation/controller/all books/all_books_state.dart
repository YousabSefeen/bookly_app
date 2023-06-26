import 'package:bookly/core/enums/request_state.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/home_model.dart';

class AllBooksStates extends Equatable {
  final List<HomeModel> allBooks;
  final String allBooksErrorMessage;
  final RequestState allBooksState;

  const AllBooksStates({
    this.allBooks = const [],
    this.allBooksState = RequestState.loading,
    this.allBooksErrorMessage = '',
  });

  AllBooksStates copyWith({
    List<HomeModel>? allBooks,
    String? allBooksErrorMessage,
    RequestState? allBooksState,
  }) {
    return AllBooksStates(
      allBooks: allBooks ?? this.allBooks,
      allBooksState: allBooksState ?? this.allBooksState,
      allBooksErrorMessage: allBooksErrorMessage ?? this.allBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        allBooks,
        allBooksErrorMessage,
        allBooksState,
      ];
}
