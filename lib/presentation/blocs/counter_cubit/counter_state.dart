part of 'counter_cubit.dart';

class CounterState extends Equatable {

  final int couter;
  final int transactionCount;

  const CounterState({
    this.couter = 0, 
    this.transactionCount = 0
  });

  // * Emitir una copia del estado
  copyWith({
    int? couter,
    int? transactionCount,
  }) => CounterState(
    couter: couter ?? this.couter,
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  // * Se va a regresar un listado con todas las propiedades 
  // * que voy a considerar que el estado sea igual
  // * Si el counter y el transactionCount son iguales a pesar de que emita un nuevo estado
  // * No se va a redibujar
  @override
  List<Object?> get props => [ couter, transactionCount ];
}
