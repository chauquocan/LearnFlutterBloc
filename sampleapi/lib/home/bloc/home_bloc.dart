import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:sampleapi/services/bored_service.dart';
import 'package:sampleapi/services/connectivity_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  final ConnectivityService _connectivityService;
  HomeBloc(this._boredService, this._connectivityService)
      : super(HomeLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No internet event');
        add(NoInternetEvent());
      } else {
        print('Yes internet event');
        add(LoadApiEvent());
      }
    });
    on<LoadApiEvent>((event, emit) async {
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadingState());
      emit(HomeLoadedState(
          activity.activity, activity.type, activity.participants));
    });
    on<NoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }
}
