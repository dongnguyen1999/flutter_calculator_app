import 'package:calculator_app/widgets/keyboard/key_button.dart';
import 'package:calculator_app/widgets/keyboard/key_configs.dart';
import 'package:spannable_grid/spannable_grid.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: SpannableGrid(
        columns: 4,
        rows: 5,
        cells: keyboardConfigsFrom(context).map((config) {
          return SpannableGridCellData(
            id: config.id,
            row: (config.id / 4).floor() + 1,
            column: (config.id % 4) + 1,
            columnSpan: config.span,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: KeyButton(
                id: config.id,
                title: config.title,
                handler: config.handler,
                span: config.span,
                type: config.type,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
