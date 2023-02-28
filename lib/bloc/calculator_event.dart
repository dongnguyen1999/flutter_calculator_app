part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NumberPressed extends CalculatorEvent {
  final String data;

  NumberPressed(this.data);

  @override
  List<Object?> get props => [data];
}

class InputClear extends CalculatorEvent {}

class OperatorPressed extends CalculatorEvent {
  final Operator operator;

  OperatorPressed(this.operator);
  @override
  List<Object?> get props => [operator];
}

class ResultPressed extends CalculatorEvent {}

class SignToggled extends CalculatorEvent {}

class PercentageToggled extends CalculatorEvent {}
