part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumberEvent extends CalculatorEvent {
  final int number;

  AddNumberEvent(this.number);
}

class AddOperatorEvent extends CalculatorEvent {
  final OperationType operator;

  AddOperatorEvent(this.operator);
}

class AddDecimalEvent extends CalculatorEvent {}

class DeleteLastEntryEvent extends CalculatorEvent {}

class DeleteAllEvent extends CalculatorEvent {}

class ResetEvent extends CalculatorEvent {}

class ChangeSignEvent extends CalculatorEvent {}

class CalculateEvent extends CalculatorEvent {}
