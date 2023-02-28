import 'package:calculator_app/bloc/calculator_bloc.dart';
import 'package:calculator_app/models/key_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeyButton extends StatelessWidget {
  static const _clearKeyId = 0;

  final int id;
  final String title;
  final VoidCallback handler;
  final int span;
  final KeyType type;

  const KeyButton({
    required this.id,
    required this.title,
    required this.handler,
    this.type = KeyType.number,
    this.span = 1,
    super.key,
  });

  Color getButtonColor(BuildContext context, CalculatorState state) {
    switch (type) {
      case KeyType.number:
        return Theme.of(context).primaryColorLight;
      case KeyType.operator:
        return state.operator?.symbol == title
            ? Theme.of(context).colorScheme.secondary.withAlpha(0)
            : Theme.of(context).colorScheme.secondary;
      case KeyType.function:
        return Theme.of(context).primaryColor;
    }
  }

  String displayTitle(CalculatorState state) {
    if (id == _clearKeyId) {
      final input = double.tryParse(state.input) ?? 0;
      return input == 0 ? 'AC' : 'C';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: getButtonColor(context, state),
                shape: span > 1
                    ? RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(constraints.maxHeight / 2),
                      )
                    : const CircleBorder(),
              ),
              onPressed: handler,
              child: Text(
                displayTitle(state),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          },
        );
      },
    );
  }
}
