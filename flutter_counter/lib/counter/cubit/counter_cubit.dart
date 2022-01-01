import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'counter_state.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  //add 1 to the current state
  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  //Subtract 1  from the current state
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
