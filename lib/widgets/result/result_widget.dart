import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/bloc/calculator_bloc.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            CalculationResultWidget(value: state.processor.formatResult())
          ],
        );
      },
    );
  }
}

class CalculationResultWidget extends StatelessWidget {
  final String value;

  CalculationResultWidget({super.key, required this.value});

  final _fontSizes = [100, 90, 80, 75, 65, 60, 55, 50, 40, 39, 35, 30];
  final _textLengthThresholds = [15, 20, 25, 30, 35, 50, 60, 80, 100, 140, 158];

  double getFontSize(BuildContext context) {
    int textLength = value.length;
    var fontSize = 100;

    for (int i = 0; i < _textLengthThresholds.length; i++) {
      if (textLength <= _textLengthThresholds[i]) {
        fontSize = _fontSizes[i];
        break;
      }
    }

    return fontSize.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 20, right: 20),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: getFontSize(context),
        ),
      ),
    );
  }
}
