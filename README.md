# forms_app

A new Flutter project.





## Forms App

#### Iniciamos creando las carpetas `config` y dentro de config creamos `route y theme`

- Creamos el archivo `app_theme.dart`

```dart
import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() {

    const seedColor = Colors.deepPurple;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      // * Asociar el color del seedColor al listTileTheme
      // * Le coloca el color del seedColor al icono
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor
      )
    );
  }
}
```

#### Asociamos el `AppTheme` en el `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),     // -> Se agrega el AppTheme
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

```

#### Creamos la carpeta `presentation` y dentro de presentation creamos `screens`

- Creamos el archivo `home_screen.dar`

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          )

        ],
      ),
    );
  }
}
```

- Creamos el archivo de barril `screens.dart` dentro de la carpeta `screens`

```dart
export 'home_screen.dart';
```

#### Instalamos go_router, para la navegación entre pantalla

- Creamos el archivo `app_router.dart` en la carpeta `router`

```dart
import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const HomeScreen(),
    )

  ]
);
```

#### Conectamos el `AppRouter` con el `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(      // -> Agregamos el .router en MaterialApp
      routerConfig: appRouter,      // -> Conectamos el appRouter y quitamos lo que habia en el home
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

```

#### Ahora creamos el screen `cubit_counter_screen.dart` en la carpeta `screens`

```dart
import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
      ),
      body: Center(
        child: const Text('Counter value: xxx'),
      ),
    );
  }
}
```

- Agregamos el screen en el archivo de barril `screens.dart`

```dart
export 'home_screen.dart';
export 'cubit_counter_screen.dart';
```

#### Configuramos la ruta para navegar al `CubitCounterScreen`

```dart
import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),      // -> Agregamos el CubitCounterScreen
    )

  ]
);
```

- En el `home_screen.dart`, en el `onTab`, agregamos el código para navegar a la pantalla `CubitCounterScreen`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');      // -> Se agrego 
            },
          )

        ],
      ),
    );
  }
}
```

#### Agregar diseño al `cubit_counter_screen`

```dart
import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        // * Agregar un boton arriba
        actions: [

          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.refresh_outlined)
          )

        ],
      ),
      body: const Center(
        child: Text('Counter value: xxx'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            // -> Se agrega el heroTag cuando se tiene mas de un FloatingActionButton, y le indicamos a flutter cuan es el que se anima por defecto entre Scaffols 
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

           FloatingActionButton( 
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

           FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

        ],
      ),
    );
  }
}
```

#### Creamos una copia del archivo `cubit_counter_screen.dart` y la llamaremos `bloc_counter_screen.dart`

```dart
import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        // * Agregar un boton arriba
        actions: [

          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.refresh_outlined)
          )

        ],
      ),
      body: const Center(
        child: Text('Counter value: xxx'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            // -> Se agrega el heroTag cuando se tiene mas de un FloatingActionButton, y le indicamos a flutter cuan es el que se anima por defecto entre Scaffols 
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

           FloatingActionButton( 
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

           FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),

        ],
      ),
    );
  }
}
```

- Agregamos ese archivo al archivo de barril `screens.dart`

```dart
export 'home_screen.dart';
export 'cubit_counter_screen.dart';
export 'bloc_counter_screen.dart';

```

### Cubit Gestor de Estados

- Instalamos `flutter pub add flutter_bloc`, ya que eso tambien instala los `cubits`

- Creamos la carpeta `blocs`, dentro de `presentation`
- Le damos click derecho a la carpeta `bloc` y seleccionamos `Cubit: New Cubit`
- Pide que agregemos un nombre `counter`
- Crea la carpeta `cubit`, y los archivos `counter_cubit.dart` y `counter_state.dart`
- Renombramos la carpeta `cubit` por `counter_cubit`

- En el archivo `counter_state.dart` quitamos `@immutable` y borramos la clase y agregamos lo siguiente

```dart
part of 'counter_cubit.dart';

class CounterState {

  final int couter;
  final int transactionCount;

  CounterState({
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
}

```


- En el archivo `counter_cubit.dart` quitamos:
    - `import 'package:meta/meta.dart';` 
- En el archivo `counter_cubit.dart` sustituimos:
    - `import 'package:bloc/bloc.dart';` por `import 'package:flutter_bloc/flutter_bloc.dart';`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';


// * Se puede ver similar como un Provider, se pueden crear metodos y propiedades
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState( couter: 5 ));


  // * Metodos que emite nuevos estados
  void increaseBy( int value ) {
    emit( state.copyWith(
      couter: state.couter + value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void reset( int value ) {
    emit( state.copyWith(
      couter: 0
    ));
  }
}
```

#### Consumir y utilizar el CounterCubit

- El CounterCubit solo va a vivir en el `cubit_counter_screen.dart`

- En el `cubit_counter_screen.dart` extraemos en un nuevo widget el `Scafolld` y lo llamaremos `_CubitCounterView`
- El `_CubitCounterView` lo envolvemos en un nuevo widget y lo llamaremos `BlocProvider`

- Ahora envolvemos el `Text` en un `BlocBuilder`

```dart
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

  @override
  Widget build(BuildContext context) {

    // * Forma 2 de escuchar los cambios que tiene el state
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${ counterState.transactionCount }'),
        // * Agregar un boton arriba
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_outlined))
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
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

```


#### Llamar métodos del cubit

```dart
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
        // title: Text('Cubit Counter: ${ counterState.transactionCount }'),
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

```

#### Equatable

Documentación: https://pub.dev/packages/equatable

- Instalación `flutter pub add equatable`

- Modificamos el archivo `counter_state.dart`

```dart
part of 'counter_cubit.dart';

class CounterState extends Equatable {      // -> se agrego el extends Equatable

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
  List<Object?> get props => [ couter, transactionCount ];      // -> Se agrego el override
}

```

- Modificación en el archivo `cubit_counter_screen`

```dart
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

```

### BLoC y Flutter BLoC

- Agregamos la nueva ruta en `app_router.dart`

```dart

import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),

    GoRoute(        // -> Se agrego la nueva ruta a la pantalla BlocCounterScreen
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    )

  ]
);
```

- Agregamos el nuevo `ListTile` al `ListView` en el `home_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),

          ListTile(     // -> Agregamos el nuevo ListTile del BLoc
            title: const Text('BLoC'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/counter-bloc');
            },
          )

        ],
      ),
    );
  }
}
```

- Ahora hacemos click derecho en la carpeta `presentation` y elejimos `Bloc: New Bloc` y agregamos el nombre del bloc `counter`

- Renombro la carpeta `bloc` por `counter_bloc` y la movemos dentro de la carpeta `blocs`

- Realizamos uno cambios en el archivo `counter_state.dart`

```dart
part of 'counter_bloc.dart';

// * Quitamos abstract y solo dejamos class
class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 10, 
    this.transactionCount = 0
  });

  CounterState copyWith({

    int? counter,
    int? transactionCount,

  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  @override
  List<Object> get props => [ counter, transactionCount ];
}

```

- Realizamos uno cambios en el archivo `counter_event.dart`

```dart
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
```

- Realizamos uno cambios en el archivo `counter_bloc.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {

    on<CounterIncreased>((event, emit) {

      emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1
      ));
    });
  }
}

```

#### Simplificar el handler del BLoC

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {

    on<CounterIncreased>( _onCounterIncreased );

    // on<CounterIncreased>((event, emit) {

    //   emit(state.copyWith(
    //     counter: state.counter + event.value,
    //     transactionCount: state.transactionCount + 1
    //   ));
    // });
  }

  // * Manejador o Handler
  void _onCounterIncreased( CounterIncreased event, Emitter<CounterState> emit ) {

      emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1
      ));
    }
}
```

#### Utilizar Counter BLoC

- Vamos al archivo `bloc_counter_screen.dart`

- Extraer en un nuevo widget el `Scaffold`, llamado `BlocCounterView`
- Ahora envuelvo en un `BlocProvider` el `BlocCounterView`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [ int value = 1 ] ) {       // -> Creamos esta nueva función
    // * Con el .add -> disparo un evento
    context.read<CounterBloc>().add( CounterIncreased(value) );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>  Text('Bloc Counter: ${ counterBloc.state.transactionCount }')),
        // * Agregar un boton arriba
        actions: [
          IconButton(onPressed: () => context.read<CounterBloc>().add(CounterReset()), 
          icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(

        child: context.select(
          (CounterBloc counterBloc) => Text('Counter value: ${ counterBloc.state.counter }'),
        )
        
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

```


#### Disparar eventos dentro del BLoC

- Modificamos el `counter_bloc.dart`

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {

    on<CounterIncreased>( _onCounterIncreased );
    on<CounterReset>( _onCounterReset );

  }

  // * Manejador o Handler
  void _onCounterIncreased( CounterIncreased event, Emitter<CounterState> emit ) {

    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void _onCounterReset( CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0
    ));
  }

  // * Centralizar
  void increaseBy([ int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCount() {
    add(CounterReset());
  }
}

```

- Modificamos el `bloc_counter_screen.dar`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [ int value = 1 ] ) {
    // * Con el .add -> disparo un evento
    // context.read<CounterBloc>().add( CounterIncreased(value) );
    context.read<CounterBloc>().increaseBy(value);      // -> Se modifico
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>  Text('Bloc Counter: ${ counterBloc.state.transactionCount }')),
        // * Agregar un boton arriba
        actions: [
          IconButton(onPressed: () => context.read<CounterBloc>().resetCount(),     // -> Se modifico 
          icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(

        child: context.select(
          (CounterBloc counterBloc) => Text('Counter value: ${ counterBloc.state.counter }'),
        )
        
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

```

### Manejo de Formularios

- Creamos el archivo `register_screen.dart`

```dart
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

- Agregamos la nueva ruta en `app_router.dart`

```dart

import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),

    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),

    GoRoute(        // -> Agregamos la nueva ruta 
      path: '/new-user',
      builder: (context, state) => const RegisterScreen(),
    )

  ]
);
```

- Agregamos el `ListTile` en el `ListView`, dentro del archivo `home_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),

          ListTile(
            title: const Text('BLoC'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/counter-bloc');
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

           ListTile(        // -> Se agrego el nuevo ListTile
            title: const Text('Nuevo usuario'),
            subtitle: const Text('manejo de formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/new-user');
            },
          ),
        ],
      ),
    );
  }
}
```

#### Consideraciones con Inputs y Scroll

- Cuando se tiene un input dentro de un Column, es necesario utilizar el widget `SingleChildScrollView`, para que se puede hacer scroll cuando se muestra el teclado

- Abrimos el archivo `register_screen.dart`

```dart
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
        
              const FlutterLogo( size: 300 ),
        
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),

              const SizedBox(height: 20),

              FilledButton.tonalIcon(
                onPressed: () {}, 
                icon: const Icon( Icons.save ), 
                label: const Text('Crear usuario')
              ),

              const SizedBox(height: 100)
        
            ],
          ),
        ),
      ),
    );
  }
}
```

#### Diseño de campo de texto

- Creamos un archivo `custom_text_form_field.dart` dentro de la carpeta `presentation -> widgets -> inputs`

- Ahi vamos personalizando nuestro `CustomTextFormField`

```dart
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField(
      onChanged: (value) {},
      validator: (value) {
        if ( value == null ) return 'Campo es requerido';
        if ( value.isEmpty ) return 'Campo es requerido';
        if ( value.trim().isEmpty ) return 'Campo es requerido';

        return null;
      },
      // * Para cambiar la apariencia física del input usamos el decoration: InputDecoration
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primary) )
      ),
    );
  }
}
```

- Agregamos el `CustomTextFormField` en el `register_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: const [
        
              FlutterLogo( size: 100 ),
        
              _RegisterForm(),

              SizedBox(height: 20),
        
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        
        children: [

          CustomTextFormField(),        // -> se agrego el CustomTextFormField

          const SizedBox(height: 10),
          
          CustomTextFormField(),         // -> se agrego el CustomTextFormField

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {}, 
            icon: const Icon( Icons.save ), 
            label: const Text('Crear usuario')
          ),

        ],

      ),
    );
  }
}
```

#### Finalizar el CustomTextFormField, se puede usar como base para crear cualquier widget con propiedades

```dart
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      // * Para cambiar la apariencia física del input usamos el decoration: InputDecoration
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primary) ),
        errorBorder: border.copyWith( borderSide: BorderSide(color: Colors.red.shade800) ),
        focusedErrorBorder: border.copyWith( borderSide: BorderSide(color: Colors.red.shade800) ),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary
      ),


    );
  }
}
```

#### Formulario tradicional;

- Transformamos el `_RegisterForm` en el archivo  `register_screen.dart` de un  `StatelessWidget` a  un `StatefulWidget` 

```dart
import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: const [
        
              FlutterLogo( size: 100 ),
        
              _RegisterForm(),

              SizedBox(height: 20),
        
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.length < 6 ) return 'Más de 6 caracteres';
              return null;
            },
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => email = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if ( !emailRegExp.hasMatch(value) ) return 'No tiene formato de correo';
              return null;
            },
          ),

          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => password = value,
             validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.length < 6 ) return 'Más de 6 caracteres';
              return null;
            },
            
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {

              final isValid = _formKey.currentState!.validate();
              if ( isValid ) return;

              print('$username, $email, $password');
            }, 
            icon: const Icon( Icons.save ), 
            label: const Text('Crear usuario')
          ),

        ],

      ),
    );
  }
} 
```


