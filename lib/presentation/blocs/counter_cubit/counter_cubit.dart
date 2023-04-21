import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';


// * Se puede ver similar como un Provider, se pueden crear metodos y propiedades
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState( couter: 5 ));


  // * Metodos que emite nuevos estados
  void increaseBy( int value ) {
    emit( state.copyWith(
      couter: state.couter + value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void reset() {
    emit( state.copyWith(
      couter: 0
    ));
  }
}
