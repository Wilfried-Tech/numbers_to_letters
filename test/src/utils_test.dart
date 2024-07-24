import 'package:numbers_to_letters/src/utils.dart';
import 'package:test/test.dart';

void main() {
  group('removeLeadingZero', () {
    test('000000 = 0', () {
      expect(removeLeadingZero('000000'), equals('0'));
    });

    test('100 = 100', () {
      expect(removeLeadingZero('100'), equals('100'));
    });

    test('0012300 = 12300', () {
      expect(removeLeadingZero('0012300'), equals('12300'));
    });

    test(' \'\' = \'\'', () {
      expect(removeLeadingZero(''), equals(''));
    });
  });

  group('divideIntoHundredsTensUnits', () {
    test('123 = 1,2,3', () {
      expect(divideIntoHundredsTensUnits(123), equals((1, 2, 3)));
    });
    test('23 = 0,2,3', () {
      expect(divideIntoHundredsTensUnits(23), equals((0, 2, 3)));
    });
  });

  group('divideHundreds', () {
    test('123 = [123]', () {
      expect(divideIntoHundreds('123'), equals([123]));
    });
    test('1234567 = [1, 234, 567]', () {
      expect(divideIntoHundreds('1234567'), equals([1, 234, 567]));
    });
  });
}
