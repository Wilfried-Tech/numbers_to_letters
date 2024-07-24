import 'numbers_to_letters_base.dart';
import 'utils.dart';

///
class NumbersToLettersEnglish extends NumbersToLettersBase {
  final String variant;

  NumbersToLettersEnglish(this.variant);

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
      return suffix.isEmpty ? zero : '';
    }

    unitOut = ((tens > 0) && (unit != 0)) ? separator : '';
    unitOut += unitsWords[unit];

    if (tens == 1 && unit > 0) {
      tensOut = unitsWords[unit + 10];
      unitOut = '';
    } else {
      tensOut = tensWords[tens];
    }

    hundredsOut = (hundreds > 0) ? '${unitsWords[hundreds]} hundred' : '';

    output = hundredsOut;
    if (tensOut.isNotEmpty) {
      output += '${(hundreds != 0 && tens != 0) ? ' and' : ''} $tensOut';
    }
    if (unitOut.isNotEmpty) {
      output +=
          '${(hundreds != 0 && unit != 0 && tens == 0) ? ' and ' : ''}$unitOut';
    }

    if (suffix.isEmpty) {
      return '${hasThousandsPlus && hundreds == 0 ? 'and ' : ''}${output.trim()}';
    }
    return '$output $suffix';
  }

  @override
  String addMinus(String output) => 'minus $output';

  @override
  String get zero => variant.toLowerCase().contains('gb') ? 'nought' : 'zero';

  @override
  List<String> get numberSuffix => [
        '',
        'thousand',
        'million',
        'billion',
        'trillion',
        'quadrillion',
        'quintillion',
        'sextillion',
        'septillion',
        'octillion',
        'nonillion',
        'decillion',
        // you can complete here
      ];

  @override
  List<String> get tensWords => [
        '',
        'ten',
        'twenty',
        'thirty',
        'forty',
        'fifty',
        'sixty',
        'seventy',
        'eighty',
        'ninety',
      ];

  @override
  List<String> get unitsWords => [
        '',
        'one',
        'two',
        'three',
        'four',
        'five',
        'six',
        'seven',
        'eight',
        'nine',
        'ten',
        'eleven',
        'twelve',
        'thirteen',
        'fourteen',
        'fifteen',
        'sixteen',
        'seventeen',
        'eighteen',
        'nineteen',
      ];
}
