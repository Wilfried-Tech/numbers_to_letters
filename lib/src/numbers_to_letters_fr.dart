import 'numbers_to_letters_base.dart';
import 'utils.dart';

///
class NumbersToLettersFrench extends NumbersToLettersBase {
  @override
  String convertHundreds(
    int number,
    String suffix, {
    bool hasThousandsPlus = false,
  }) {
    String unitOut = '';
    String tensOut = '';
    String hundredsOut = '';
    String output = '';

    final (hundreds, tens, unit) = divideIntoHundredsTensUnits(number);
    if (number == 0) {
      output = zero;
    } else {
      unitOut = ((unit == 1) && (tens > 0)) ? 'et$separator' : '';
      unitOut += unitsWords[unit];

      if (tens == 1 && unit > 0) {
        tensOut = unitsWords[unit + 10];
        unitOut = '';
      } else if (tens == 7 || tens == 9) {
        tensOut = "${tensWords[tens]}$separator";
        tensOut += (tens == 7 && unit == 1) ? "et$separator" : "";
        tensOut += unitsWords[10 + unit];
        unitOut = '';
      } else {
        tensOut = tensWords[tens];
      }

      tensOut += (unit == 0 && tens == 8) ? 's' : '';

      hundredsOut = (hundreds > 1) ? '${unitsWords[hundreds]}$separator' : '';
      hundredsOut += (hundreds > 0) ? 'cent' : '';
      // NOTE: handle case where hundred ends with 's'
      // hundredsOut += (hundreds > 1 && tens == 0 && unit == 0) ? 's' : '';

      output += hundredsOut;
      if (output.isNotEmpty &&
          !output.endsWith(separator) &&
          tensOut.isNotEmpty) {
        output += separator;
      }

      output += tensOut;
      output += (output.isNotEmpty &&
              !output.endsWith(separator) &&
              unitOut.isNotEmpty)
          ? separator
          : '';
      output += unitOut;
    }
    if (output == zero && suffix.isNotEmpty) {
      return '';
    } else if (output == 'un' && suffix == 'mille') {
      return 'mille';
    } else if (suffix.isEmpty) {
      return output;
    }
    return '$output$separator$suffix';
  }

  @override
  String addMinus(String output) => 'moins $output';

  @override
  String get zero => 'zéro';

  @override
  List<String> get numberSuffix => [
        '',
        'mille',
        'million',
        'milliard',
        'billion',
        'billiard',
        'trillion',
        'trilliard',
        'quadrillion',
        'quadrilliard',
        'quintillion',
        'quintilliard',
        'sextillion',
        'sextilliard',
        'septillion',
        'septilliard',
        'octillion',
        'octilliard',
        'nonillion',
        'nonilliard',
        'decillion',
        'decilliard',
        // you can complete here
      ];

  @override
  List<String> get tensWords => [
        '',
        'dix',
        'vingt',
        'trente',
        'quarante',
        'cinquante',
        'soixante',
        'soixante',
        'quatre${separator}vingt',
        'quatre${separator}vingt',
      ];

  @override
  List<String> get unitsWords => [
        '',
        'un',
        'deux',
        'trois',
        'quatre',
        'cinq',
        'six',
        'sept',
        'huit',
        'neuf',
        'dix',
        'onze',
        'douze',
        'treize',
        'quatorze',
        'quinze',
        'seize',
        'dix${separator}sept',
        'dix${separator}huit',
        'dix${separator}neuf',
      ];
}
