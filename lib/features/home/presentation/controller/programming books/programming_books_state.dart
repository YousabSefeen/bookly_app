import 'package:equatable/equatable.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../data/models/home_model.dart';

class ProgrammingBooksStates extends Equatable {
  final List<HomeModel> programmingBooks;
  final String programmingBooksErrorMessage;
  final RequestState programmingBooksState;

  const ProgrammingBooksStates({
    this.programmingBooks = const [],
    this.programmingBooksState = RequestState.loading,
    this.programmingBooksErrorMessage = '',
  });

  ProgrammingBooksStates copyWith({
    List<HomeModel>? programmingBooks,
    String? programmingBooksErrorMessage,
    RequestState? programmingBooksState,
  }) {
    return ProgrammingBooksStates(
      programmingBooks: programmingBooks ?? this.programmingBooks,
      programmingBooksState:
          programmingBooksState ?? this.programmingBooksState,
      programmingBooksErrorMessage:
          programmingBooksErrorMessage ?? this.programmingBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        programmingBooks,
        programmingBooksErrorMessage,
        programmingBooksState,
      ];
}
