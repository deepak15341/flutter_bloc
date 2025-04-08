import 'package:bloc_practice/counter/counter_bloc/counter_event.dart';
import 'package:bloc_practice/counter/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState(count: 0)) {
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(CounterIncrementState(incrementCount: event.count + 1));
      },
    );
    on<CounterDecrementEvent>(
      (event, emit) {
        emit(CounterDecrementState(decrementCount: event.count - 1));
      },
    );
  }

  int counter = 0;
}
