import 'package:bookly/core/enums/request_state.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/home_model.dart';

class NewestBooksStates extends Equatable {
  final List<HomeModel> newestBooks;
  final String newestBooksErrorMessage;
  final RequestState newestBooksState;

  const NewestBooksStates({
    this.newestBooks = const [],
    this.newestBooksState = RequestState.loading,
    this.newestBooksErrorMessage = '',
  });

  NewestBooksStates copyWith({
    List<HomeModel>? newestBooks,
    String? newestBooksErrorMessage,
    RequestState? newestBooksState,
  }) {
    return NewestBooksStates(
      newestBooks: newestBooks ?? this.newestBooks,
      newestBooksState: newestBooksState ?? this.newestBooksState,
      newestBooksErrorMessage:
          newestBooksErrorMessage ?? this.newestBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        newestBooks,
        newestBooksErrorMessage,
        newestBooksState,
      ];
}
