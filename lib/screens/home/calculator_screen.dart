import 'package:calculadora/widgets/buttons/calculator_button.dart';
import 'package:calculadora/widgets/result/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/bloc/calculator_bloc.dart';
import '../../processor/CalculatorProcessor.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blockCalculator = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            // Se alinean todas las final desde el final, si las quiero centradas
            // uso en center, botton para que aparecan arriba
            mainAxisAlignment: MainAxisAlignment.end,
            // <> son de tipo generico, solo admitira un arreglo de Widgets
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              const ResultWidget(),
              Row(
                // Los elementos se alinean horizontalmente centrados
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalculatorButton(
                    // CalculatorButtonType.TERTIARY -> Botton de color gris
                    // CalculatorButtonType.PRIMARY -> Botton de color oscuro (NEGRO)
                    // CalculatorButtonType.SECONDARY -> Botton de color naranga
                    type: CalculatorButtonType.TERTIARY,
                    text: "C",
                    pressAction: () => blockCalculator.add(DeleteAllEvent()),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.TERTIARY,
                    text: "+/-",
                    pressAction: () => blockCalculator.add(ChangeSignEvent()),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.TERTIARY,
                    text: "DEL",
                    pressAction: () =>
                        blockCalculator.add(DeleteLastEntryEvent()),
                    longPressAction: () =>
                        blockCalculator.add(DeleteAllEvent()),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.SECONDARY,
                    text: "÷",
                    pressAction: () => blockCalculator
                        .add(AddOperatorEvent(OperationType.divide)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "7",
                    pressAction: () => blockCalculator.add(AddNumberEvent(7)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "8",
                    pressAction: () => blockCalculator.add(AddNumberEvent(8)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "9",
                    pressAction: () => blockCalculator.add(AddNumberEvent(9)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.SECONDARY,
                    text: "X",
                    pressAction: () => blockCalculator
                        .add(AddOperatorEvent(OperationType.multiply)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "4",
                    pressAction: () => blockCalculator.add(AddNumberEvent(4)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "5",
                    pressAction: () => blockCalculator.add(AddNumberEvent(5)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "6",
                    pressAction: () => blockCalculator.add(AddNumberEvent(6)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.SECONDARY,
                    text: "-",
                    pressAction: () => blockCalculator
                        .add(AddOperatorEvent(OperationType.subtract)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "1",
                    pressAction: () => blockCalculator.add(AddNumberEvent(1)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "2",
                    pressAction: () => blockCalculator.add(AddNumberEvent(2)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "3",
                    pressAction: () => blockCalculator.add(AddNumberEvent(3)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.SECONDARY,
                    text: "+",
                    pressAction: () => blockCalculator
                        .add(AddOperatorEvent(OperationType.add)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: "0",
                    big: true,
                    pressAction: () => blockCalculator.add(AddNumberEvent(0)),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.PRIMARY,
                    text: ".",
                    pressAction: () => blockCalculator.add(AddDecimalEvent()),
                  ),
                  CalculatorButton(
                    type: CalculatorButtonType.SECONDARY,
                    text: "=",
                    pressAction: () => blockCalculator.add(CalculateEvent()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
