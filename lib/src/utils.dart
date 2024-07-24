/// helpfull functions to parse and transform numbers
library utils;

import 'extensions.dart';

/// remove leadings zeros in a string
/// ```dart
/// removeLeadingZero('000045'); // '45'
/// ```
///
String removeLeadingZero(String s) {
  if (s.trim().isEmpty) {
    return '';
  }
  s = s.trim().replaceAll(RegExp('^(0*)'), '');
  return s.isEmpty ? '0' : s;
}

/// divide a number into hundreds, tens and units
/// ```dart
/// divideIntoHundredsTensUnits(203); // (hundreds(2), tens(0), units(3))
/// ```
(int, int, int) divideIntoHundredsTensUnits(int number) {
  assert(
      number.toString().length <= 3, 'number digit must be less or egal to 3');
  number = number.abs();
  final int unit = number % 10;
  int tens = (number % 100) - unit;
  int hundreds = (number % 1000) - (tens + unit);
  tens = tens ~/ 10;
  hundreds = hundreds ~/ 100;
  return (hundreds, tens, unit);
}

/// divide a number into hundreds like 123456789 => [123, 456, 789]
/// ```dart
/// divideIntoHundreds('1234056007'); // [1, 234, 56, 7]
/// ```
List<int> divideIntoHundreds(String strNumber) {
  if (!strNumber.isInteger()) {
    throw FormatException(
        "value contains not digits characters or is an empty string");
  }
  strNumber = strNumber.reverse();
  final List<String> numberChunck = [];
  String buffer = '';
  for (int i = 0, count = 0; i < strNumber.length; i++, count++) {
    if (count == 3) {
      numberChunck.add(buffer.reverse());
      buffer = '';
      count = 0;
    }
    buffer = buffer + strNumber[i];
  }
  numberChunck.add(buffer.reverse().toString());
  return numberChunck.reversed.map(int.parse).toList();
}
