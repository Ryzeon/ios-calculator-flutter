class CalculatorProcessor {
  bool addingDecimal = false;
  OperationType operation = OperationType.none;

  String lastNumber = "0";
  String currentNumber = "0";

  String formatResult() {
    if (currentNumber == "NaN") {
      currentNumber = "0";
      return "Error";
    }
    StringBuffer result = StringBuffer();
    var split = currentNumber.split(".");
    if (split[0].length > 3) {
      String value = split[0];
      result.write(value.replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'));
    } else {
      result.write(split[0]);
    }

    if (split.length > 1) {
      result.write(".");
      result.write(split[1]);
    }

    return result.toString();
  }

  Stream<String> formatResultAsync() async* {
    yield formatResult();
  }

  void setOperation(OperationType operation) {
    this.operation = operation;
    lastNumber = currentNumber;
    currentNumber = "0";
    addingDecimal = false;
  }

  void addNumber(int number) {
    if (addingDecimal) {
      if (currentNumber.contains(".")) {
        currentNumber = currentNumber + number.toString();
      } else {
        currentNumber = "$currentNumber.$number";
      }
    } else {
      if (currentNumber == "0") {
        currentNumber = number.toString();
      } else {
        currentNumber = currentNumber + number.toString();
      }
    }
  }

  void deleteLast() {
    if (currentNumber.length > 1) {
      currentNumber = currentNumber.substring(0, currentNumber.length - 1);
      if (!currentNumber.contains(".")) {
        addingDecimal = false;
      }
    } else {
      currentNumber = "0";
      addingDecimal = false;
    }
  }

  void deleteAll() {
    currentNumber = "0";
    addingDecimal = false;
  }

  void process() {
    if (operation != OperationType.none) {
      double a = double.parse(lastNumber);
      double b = double.parse(currentNumber);
      double resultDouble = operation.calculate(a, b);
      String result = resultDouble.toString();
      if (result.endsWith(".0")) {
        result = result.substring(0, result.length - 2);
      } else {
        if (resultDouble.toString().split(".").length > 1 &&
            resultDouble.toString().split(".")[1].length > 3) {
          resultDouble = double.parse(resultDouble.toStringAsFixed(3));
        }
        String roundDouble = resultDouble.toString();
        if (roundDouble.endsWith(".00")) {
          result = roundDouble.substring(0, roundDouble.length - 3);
        } else {
          result = roundDouble;
        }
      }
      currentNumber = result;
      addingDecimal = false;
    }
  }

  void reset() {
    operation = OperationType.none;
    currentNumber = "0";
    lastNumber = "0";
    addingDecimal = false;
  }

  void changeSign() {
    if (currentNumber.startsWith("-")) {
      currentNumber = currentNumber.substring(1);
    } else {
      currentNumber = "-$currentNumber";
    }
  }
}

enum OperationType {
  none,
  add,
  subtract,
  multiply,
  divide;

  double calculate(double a, double b) {
    switch (this) {
      case OperationType.add:
        return a + b;
      case OperationType.subtract:
        return a - b;
      case OperationType.multiply:
        return a * b;
      case OperationType.divide:
        return a / b;
      case none:
        return 0;
    }
  }
}
