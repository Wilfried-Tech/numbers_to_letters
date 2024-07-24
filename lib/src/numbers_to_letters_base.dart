import 'package:meta/meta.dart';

import 'extensions.dart';
import 'utils.dart';

/// Base class for converting numbers to letters
abstract class NumbersToLettersBase {
  /// list of words that lead hundreds numbers
  /// like thousands, million, ...
  @protected
  abstract final List<String> numberSuffix;
  @protected
  abstract final List<String> unitsWords;
  @protected
  abstract final List<String> tensWords;
  @protected
  abstract final String zero;

  int get maxNumberLength => numberSuffix.length * 3;

  String _separator = '-';

  String get separator => _separator;

  set separator(String value) {
    if (value.isEmpty) {
      throw ArgumentError('separator must not be empty');
    }
    assert(value.length == 1, 'separator must be a single character');
    _separator = value;
  }

  @protected
  String convertHundreds(int number, String suffix,
      {bool hasThousandsPlus = false});

  @protected
  String addMinus(String output);

  String _stringToLetters(String strNumber) {
    strNumber = strNumber.trim();
    if (!strNumber.isInteger()) {
      throw FormatException(
          "value contains not digits characters or is an empty string");
    }

    if (strNumber.length > maxNumberLength) {
      throw StateError('value length exceed the max number length');
    }

    final bool negative = strNumber.startsWith('-');
    if (negative) {
      strNumber = strNumber.substring(1);
    }
    StringBuffer output = StringBuffer();
    final parts = divideIntoHundreds(strNumber).reversed.toList();
    final hasThousandsPlus =
        parts.length > 1 && parts.skip(1).any((a) => a != 0);
    for (int i = parts.length - 1; i >= 0; i--) {
      String value = convertHundreds(
        parts[i],
        numberSuffix[i],
        hasThousandsPlus: hasThousandsPlus,
      );

      if (value == zero && parts.length != 1) {
        continue;
      }
      if (value.isNotEmpty) {
        output
          ..write(value.trim())
          ..write(' ');
      }
    }
    return negative ? addMinus(output.toString()) : output.toString().trim();
  }

  String toLetters(Object number) {
    if (number is String || number is int) {
      return _stringToLetters(removeLeadingZero('$number'));
    }

    throw ArgumentError(
      'toLetters(${number.runtimeType} number) is not defined',
      'number',
    );
  }
}
