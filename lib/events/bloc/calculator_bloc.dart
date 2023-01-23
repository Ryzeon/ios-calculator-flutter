import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../processor/CalculatorProcessor.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(CalculatorProcessor()));

  CalculatorProcessor processor = CalculatorProcessor();

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is ResetEvent) {
      processor.reset();
      yield CalculatorState(processor);
    } else if (event is DeleteAllEvent) {
      processor.deleteAll();
      yield CalculatorState(processor);
    } else if (event is AddNumberEvent) {
      processor.addNumber(event.number);
      yield CalculatorState(processor);
    } else if (event is DeleteLastEntryEvent) {
      processor.deleteLast();
      yield CalculatorState(processor);
    } else if (event is AddOperatorEvent) {
      processor.setOperation(event.operator);
      yield CalculatorState(processor);
    } else if (event is AddDecimalEvent) {
      processor.addingDecimal = true;
      yield CalculatorState(processor);
    } else if (event is ChangeSignEvent) {
      processor.changeSign();
      yield CalculatorState(processor);
    } else if (event is CalculateEvent) {
      processor.process();
      yield CalculatorState(processor);
    }
  }
}
