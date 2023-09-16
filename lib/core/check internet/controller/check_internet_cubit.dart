import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_internet_states.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  CheckInternetCubit() : super(CheckInternetInitialStates());

  static CheckInternetCubit object(context) => BlocProvider.of(context);

  bool isInternetConnection = false;
  StreamSubscription? _streamSubscription;

  void checkInternetConnection() {
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        isInternetConnection = true;
        emit(InternetConnectionState());
      } else {
        emit(NoInternetConnectionState());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
