import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable{}


class CounterInitState extends CounterState{
  final int count;
  CounterInitState({required this.count});
  @override
  List<Object?> get props => [count];

}

class CounterIncrementState extends CounterState{
  final int incrementCount;
  CounterIncrementState({required this.incrementCount});
  @override
  List<Object?> get props => [incrementCount];
}


class CounterDecrementState extends CounterState{
  final int decrementCount;
  CounterDecrementState({required this.decrementCount});
  @override
  List<Object?> get props => [decrementCount];
}