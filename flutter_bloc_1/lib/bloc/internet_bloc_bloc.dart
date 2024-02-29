import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_bloc_event.dart';
part 'internet_bloc_state.dart';

class InternetBlocBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  //---------------------------*Variables*------------------------------//
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  //---------------------------*INITALISE*------------------------------//
  // super : initalise the bloc
  InternetBlocBloc() : super(InternetBlocInitial()) {
    // aagar even lost hua toh yea krenge.

    //---------------------------*EMIT STATE*------------------------------//
    //event: joh event occur hua
    // emit : joh state emit krni
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    // aaagr event gain hua toh yea krenge
    on<InternetGainEvent>((event, emit) => emit(IntenetGainState()));

    //---------------------------*STREAM*------------------------------//
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });

    //---------------------------*PROBLEM*------------------------------//
    //? PROBLEM:
    // this bloc automatically dispose when our page is closed.
    // ! but the listen does not dispose and still runs.

    //---------------------------*Close Stream*------------------------------//
    @override
    Future<void> close() {
      connectivitySubscription?.cancel();
      return super.close();
    }
  }
}
