import 'package:calculator_app/bloc/calculator_bloc.dart';
import 'package:calculator_app/home_page.dart';
import 'package:calculator_app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorLight: Colors.blue.shade300,
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.amber,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 60,
              color: Colors.white,
            ),
            titleMedium: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            )),
      ),
      home: BlocProvider(
        create: (_) => CalculatorBloc(),
        child: const HomePage(),
      ),
    );
  }
}
