import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final CalculatorButtonType type;
  final String text;

  final bool big;

  final Function pressAction;

  final Function? longPressAction;

  const CalculatorButton({
    super.key,
    required this.type,
    required this.text,
    this.big = false,
    required this.pressAction,
    this.longPressAction,
  });

  double getResponsiveButtonWidth(BuildContext context) {
    double toAddIfBig = big ? 85 : 0;
    return MediaQuery.of(context).size.width * 0.17 + toAddIfBig;
  }

  double getResponsiveFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.07;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = TextButton.styleFrom(
      backgroundColor: type.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ).copyWith(
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: TextButton(
        style: style,
        onPressed: () => {
          // print("In CalculatorButton: " + text)
          pressAction(),
        },
        onLongPress: () => {
          if (longPressAction != null) {longPressAction!()}
        },
        child: SizedBox(
          width: getResponsiveButtonWidth(context),
          height: 65,
          child: Container(
            alignment: big ? Alignment.centerLeft : Alignment.center,
            padding: big ? const EdgeInsets.only(left: 20) : null,
            child: Text(
              text,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context),
                fontWeight: FontWeight.w500,
                color: type.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CalculatorButtonType {
  PRIMARY(Color(0xff333333), Colors.white),
  SECONDARY(Colors.orange, Colors.white),
  TERTIARY(Colors.grey, Colors.black);

  const CalculatorButtonType(this.color, this.textColor);
  final Color color;
  final Color textColor;
}
