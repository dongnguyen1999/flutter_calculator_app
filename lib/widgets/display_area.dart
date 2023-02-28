import 'package:calculator_app/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DisplayArea extends StatelessWidget {
  static final _normalFormater =
      NumberFormat('###,###,###.##########', 'vi_VN');
  static final _expontentFormater = NumberFormat.scientificPattern('vi_VN');

  const DisplayArea({super.key});

  String _convertDisplayValue(String input) {
    final number = double.tryParse(input) ?? 0;
    final formater =
        _normalFormater.format(number).replaceAll('.', '').length > 9
            ? _expontentFormater
            : _normalFormater;
    String displayValue = formater.format(number);
    if (input.endsWith('.')) {
      displayValue += ',';
    }
    return displayValue.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      alignment: Alignment.bottomRight,
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return Text(
            _convertDisplayValue(state.input),
            style: Theme.of(context).textTheme.titleLarge,
          );
        },
      ),
    );
  }
}
