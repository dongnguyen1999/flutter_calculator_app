import 'package:calculator_app/widgets/display_area.dart';
import 'package:calculator_app/widgets/keyboard/keyboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.size.height * 0.4,
            child: const DisplayArea(),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.6,
            child: const Keyboard(),
          )
        ],
      ),
    );
  }
}
