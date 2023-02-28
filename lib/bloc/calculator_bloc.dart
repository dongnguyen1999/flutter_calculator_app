import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState.initialState()) {
    on<NumberPressed>(_onNumberPressed);
    on<InputClear>(_onInputClear);
    on<OperatorPressed>(_onOperatorPressed);
    on<ResultPressed>(_onResultPressed);
    on<SignToggled>(_onSignToggled);
    on<PercentageToggled>(_onPercentageToggled);
  }

  void _onNumberPressed(NumberPressed event, Emitter<CalculatorState> emit) {
    if (event.data == '.' && state.input.contains('.')) {
      return;
    }
    if (state.input.replaceAll('.', '').length >= 9 && !state.willClearInput) {
      return;
    }
    final newInput =
        state.willClearInput ? event.data : state.input + event.data;
    emit(state.copyWith(
      input: newInput,
      result: state.operator == null ? double.tryParse(newInput) ?? 0 : null,
      cache: state.operator != null ? double.tryParse(newInput) ?? 0 : null,
      willClearInput: false,
    ));
  }

  void _onInputClear(InputClear event, Emitter<CalculatorState> emit) {
    if (state.input.isEmpty) {
      // All Clear
      return emit(CalculatorState.initialState());
    }
    // Clear input
    emit(state.copyWith(
      input: '',
      result: state.operator == null ? 0 : null,
      cache: state.operator != null ? 0 : null,
    ));
  }

  void _onOperatorPressed(
      OperatorPressed event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
      operator: event.operator,
      cacheOperator: event.operator,
      cache: state.operator != null ? state.cache : 0,
      willClearInput: state.operator == null,
    ));
  }

  void _onResultPressed(ResultPressed event, Emitter<CalculatorState> emit) {
    if (state.hasOperator) {
      double result = state.calculate;
      emit(CalculatorState(
        operator: null,
        cacheOperator: state.cacheOperator,
        input: result.toString(),
        result: result,
        cache: state.cache,
      ));
    }
  }

  void _onSignToggled(SignToggled event, Emitter<CalculatorState> emit) {
    final input = double.tryParse(state.input) ?? 0;
    if (input != 0) {
      final newInput = -input;
      emit(state.copyWith(
        input: newInput.toString(),
        result: state.operator == null ? newInput : null,
        cache: state.operator != null ? newInput : null,
      ));
    }
  }

  void _onPercentageToggled(
      PercentageToggled event, Emitter<CalculatorState> emit) {
    final input = double.tryParse(state.input) ?? 0;
    if (input != 0) {
      final newInput = input / 100;
      emit(state.copyWith(
        input: newInput.toString(),
        result: state.operator == null ? newInput : null,
        cache: state.operator != null ? newInput : null,
      ));
    }
  }
}
