import 'package:equatable/equatable.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/models/home_model.dart';

class SimilarBooksStates extends Equatable {
  final List<HomeModel> similarBooks;
  final String similarBooksErrorMessage;
  final RequestState similarBooksState;

  const SimilarBooksStates({
    this.similarBooks = const [],
    this.similarBooksState = RequestState.loading,
    this.similarBooksErrorMessage = '',
  });

  SimilarBooksStates copyWith({
    List<HomeModel>? similarBooks,
    String? similarBooksErrorMessage,
    RequestState? similarBooksState,
  }) {
    return SimilarBooksStates(
      similarBooks: similarBooks ?? this.similarBooks,
      similarBooksState: similarBooksState ?? this.similarBooksState,
      similarBooksErrorMessage:
          similarBooksErrorMessage ?? this.similarBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        similarBooks,
        similarBooksErrorMessage,
        similarBooksState,
      ];
}
