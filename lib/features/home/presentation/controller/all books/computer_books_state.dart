import 'package:bookly/core/enums/request_state.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/home_model.dart';

class ComputerBooksStates extends Equatable {
  final List<HomeModel> computerBooks;
  final String computerBooksErrorMessage;
  final RequestState computerBooksState;

  const ComputerBooksStates({
    this.computerBooks = const [],
    this.computerBooksState = RequestState.loading,
    this.computerBooksErrorMessage = '',
  });

  ComputerBooksStates copyWith({
    List<HomeModel>? computerBooks,
    String? computerBooksErrorMessage,
    RequestState? computerBooksState,
  }) {
    return ComputerBooksStates(
      computerBooks: computerBooks ?? this.computerBooks,
      computerBooksState: computerBooksState ?? this.computerBooksState,
      computerBooksErrorMessage:
          computerBooksErrorMessage ?? this.computerBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        computerBooks,
        computerBooksErrorMessage,
        computerBooksState,
      ];
}
