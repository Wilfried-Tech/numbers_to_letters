import 'package:numbers_to_letters/src/numbers_to_letters_en.dart';
import 'package:test/test.dart';

void main() {
  group('numbers to letters en ...', () {
    late NumbersToLettersEnglish numbersToLettersEnglish;

    setUpAll(() {
      numbersToLettersEnglish = NumbersToLettersEnglish('en');
      numbersToLettersEnglish.separator = ' ';
    });

    test('0 = zero', () {
      expect(numbersToLettersEnglish.toLetters(0),
          equals(numbersToLettersEnglish.zero));
    });

    test('1 = one', () {
      expect(numbersToLettersEnglish.toLetters(1), equals('one'));
    });

    test('20 = twenty', () {
      expect(numbersToLettersEnglish.toLetters(20), equals('twenty'));
    });

    test('100 = one hundred', () {
      expect(numbersToLettersEnglish.toLetters(100), equals('one hundred'));
    });

    test('666 = six hundred and sixty six', () {
      expect(numbersToLettersEnglish.toLetters(666),
          equals('six hundred and sixty six'));
    });

    test('1000 = one thousand', () {
      expect(numbersToLettersEnglish.toLetters(1000), equals('one thousand'));
    });

    test('1001 = one thousand and one', () {
      expect(
          numbersToLettersEnglish.toLetters(1001), equals('one thousand and one'));
    });

    test('1000002 = one million and two', () {
      expect(numbersToLettersEnglish.toLetters(1000002),
          equals('one million and two'));
    });

    test('3001001300 = three billion one million one thousand three hundred',
        () {
      expect(numbersToLettersEnglish.toLetters(3001001300),
          equals('three billion one million one thousand three hundred'));
    });

    test(
        '1096443 = one million ninety six thousand four hundred and forty three',
        () {
      expect(
          numbersToLettersEnglish.toLetters(1096443),
          equals(
              'one million ninety six thousand four hundred and forty three'));
    });
  });
}
