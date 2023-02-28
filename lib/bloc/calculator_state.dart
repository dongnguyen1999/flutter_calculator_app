part of 'calculator_bloc.dart';

abstract class Operator {
  final String symbol;

  Operator(this.symbol);

  @override
  String toString() {
    return symbol;
  }

  double calculate(double a, double b);
}

class AddOperator extends Operator {
  AddOperator() : super('+');

  @override
  double calculate(double a, double b) {
    return a + b;
  }
}

class SubOperator extends Operator {
  SubOperator() : super('-');

  @override
  double calculate(double a, double b) {
    return a - b;
  }
}

class MulOperator extends Operator {
  MulOperator() : super('x');

  @override
  double calculate(double a, double b) {
    return a * b;
  }
}

class DivOperator extends Operator {
  DivOperator() : super(':');

  @override
  double calculate(double a, double b) {
    return a / b;
  }
}

class CalculatorState extends Equatable {
  final double result;
  final double cache;
  final String input;
  final Operator? cacheOperator;
  final Operator? operator;
  final bool willClearInput;

  const CalculatorState({
    this.result = 0,
    this.cache = 0,
    this.input = '',
    this.cacheOperator,
    this.operator,
    this.willClearInput = false,
  });

  static CalculatorState initialState() {
    return const CalculatorState(
      result: 0,
      cache: 0,
      input: '',
      operator: null,
      cacheOperator: null,
    );
  }

  CalculatorState copyWith({
    double? result,
    double? cache,
    String? input,
    Operator? operator,
    Operator? cacheOperator,
    bool? willClearInput,
  }) {
    return CalculatorState(
      result: result ?? this.result,
      cache: cache ?? this.cache,
      input: input ?? this.input,
      operator: operator ?? this.operator,
      cacheOperator: cacheOperator ?? this.cacheOperator,
      willClearInput: willClearInput ?? this.willClearInput,
    );
  }

  bool get hasOperator {
    return operator != null || cacheOperator != null;
  }

  double get calculate {
    final calculator = operator ?? cacheOperator;
    return calculator?.calculate(result, cache) ?? 0;
  }

  @override
  String toString() {
    return '{input: $input, result: $result, cache: $cache, operator: $operator, cacheOperator: $cacheOperator, willClearInput: $willClearInput}';
  }

  @override
  List<Object?> get props => [
        result,
        cache,
        input,
        cacheOperator,
        operator,
      ];
}

class CalculatorInitial extends CalculatorState {}
