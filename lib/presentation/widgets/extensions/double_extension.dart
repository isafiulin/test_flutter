
extension DoubleExtension on double {
   num doubleWithoutDecimalToInt() {
    return this % 1 == 0 ? toInt() : double.parse(toStringAsFixed(2));
  }
}
