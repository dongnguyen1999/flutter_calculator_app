import 'package:calculator_app/bloc/calculator_bloc.dart';
import 'package:calculator_app/models/key_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<KeyConfig> keyboardConfigsFrom(BuildContext context) {
  CalculatorBloc bloc = context.read<CalculatorBloc>();
  return [
    KeyConfig(
      id: 0,
      title: 'AC',
      handler: () {
        bloc.add(InputClear());
      },
      type: KeyType.function,
    ),
    KeyConfig(
      id: 1,
      title: '+/-',
      handler: () {
        bloc.add(SignToggled());
      },
      type: KeyType.function,
    ),
    KeyConfig(
      id: 2,
      title: '%',
      handler: () {
        bloc.add(PercentageToggled());
      },
      type: KeyType.function,
    ),
    KeyConfig(
      id: 3,
      title: ':',
      handler: () {
        bloc.add(OperatorPressed(DivOperator()));
      },
      type: KeyType.operator,
    ),
    KeyConfig(
      id: 4,
      title: '7',
      handler: () {
        bloc.add(NumberPressed('7'));
      },
    ),
    KeyConfig(
      id: 5,
      title: '8',
      handler: () {
        bloc.add(NumberPressed('8'));
      },
    ),
    KeyConfig(
      id: 6,
      title: '9',
      handler: () {
        bloc.add(NumberPressed('9'));
      },
    ),
    KeyConfig(
      id: 7,
      title: 'x',
      handler: () {
        bloc.add(OperatorPressed(MulOperator()));
      },
      type: KeyType.operator,
    ),
    KeyConfig(
      id: 8,
      title: '4',
      handler: () {
        bloc.add(NumberPressed('4'));
      },
    ),
    KeyConfig(
      id: 9,
      title: '5',
      handler: () {
        bloc.add(NumberPressed('5'));
      },
    ),
    KeyConfig(
      id: 10,
      title: '6',
      handler: () {
        bloc.add(NumberPressed('6'));
      },
    ),
    KeyConfig(
      id: 11,
      title: '-',
      handler: () {
        bloc.add(OperatorPressed(SubOperator()));
      },
      type: KeyType.operator,
    ),
    KeyConfig(
      id: 12,
      title: '1',
      handler: () {
        bloc.add(NumberPressed('1'));
      },
    ),
    KeyConfig(
      id: 13,
      title: '2',
      handler: () {
        bloc.add(NumberPressed('2'));
      },
    ),
    KeyConfig(
      id: 14,
      title: '3',
      handler: () {
        bloc.add(NumberPressed('3'));
      },
    ),
    KeyConfig(
      id: 15,
      title: '+',
      handler: () {
        bloc.add(OperatorPressed(AddOperator()));
      },
      type: KeyType.operator,
    ),
    KeyConfig(
      id: 16,
      title: '0',
      handler: () {
        bloc.add(NumberPressed('0'));
      },
      span: 2,
    ),
    KeyConfig(
      id: 18,
      title: ',',
      handler: () {
        bloc.add(NumberPressed('.'));
      },
    ),
    KeyConfig(
      id: 19,
      title: '=',
      handler: () {
        bloc.add(ResultPressed());
      },
      type: KeyType.operator,
    ),
  ];
}
