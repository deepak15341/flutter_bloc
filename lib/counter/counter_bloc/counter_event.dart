 import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{}

 class CounterIncrementEvent extends CounterEvent{
  final int count;

  CounterIncrementEvent({required this.count});
  @override
  List<Object?> get props => [count];
}


class CounterDecrementEvent extends CounterEvent{
  final int count;

  CounterDecrementEvent({required this.count});
  @override
  List<Object?> get props => [count];
}