import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy( BuildContext context, [ int value = 1] ) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    // * Forma 2 de escuchar los cambios que tiene el state
    // final counterState = context.watch<CounterCubit>().state; -> Se comento para que no se redibujara el widget

    return Scaffold(
      appBar: AppBar(
        // * Solo quiero estar pendiente de un bloc uso el .select
        // * .select te permite obtener todo el CounterCubit
        title: context.select(( CounterCubit value) {
          return Text('Cubit Counter: ${ value.state.transactionCount }');
        }),
        
        // * Agregar un boton arriba
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(), 
            icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        // * Forma 1 de escuchar los cambios que tiene el state
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.couter != previous.couter,
          builder: (context, state) {
            return Text('Counter value: ${ state.couter }');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // -> Se agrega el heroTag cuando se tiene mas de un FloatingActionButton, y le indicamos a flutter cuan es el que se anima por defecto entre Scaffols
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
