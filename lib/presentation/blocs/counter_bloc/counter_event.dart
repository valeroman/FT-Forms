part of 'counter_bloc.dart';

// * Que tipos de eventos mi bloc va ha recibir
abstract class CounterEvent {
  const CounterEvent();
}

// * Creo un nuevo evento
class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {}

