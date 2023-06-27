import 'package:equatable/equatable.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../data/models/home_model.dart';

class FreeBooksStates extends Equatable {
  final List<HomeModel> freeBooks;
  final String freeBooksErrorMessage;
  final RequestState freeBooksState;

  const FreeBooksStates({
    this.freeBooks = const [],
    this.freeBooksState = RequestState.loading,
    this.freeBooksErrorMessage = '',
  });

  FreeBooksStates copyWith({
    List<HomeModel>? freeBooks,
    String? freeBooksErrorMessage,
    RequestState? freeBooksState,
  }) {
    return FreeBooksStates(
      freeBooks: freeBooks ?? this.freeBooks,
      freeBooksState: freeBooksState ?? this.freeBooksState,
      freeBooksErrorMessage:
          freeBooksErrorMessage ?? this.freeBooksErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        freeBooks,
        freeBooksErrorMessage,
        freeBooksState,
      ];
}
