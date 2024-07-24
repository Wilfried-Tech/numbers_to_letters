import 'package:numbers_to_letters/src/numbers_to_letters_fr.dart';
import 'package:test/test.dart';

void main() {
  group('numbers to letters fr ...', () {
    late NumbersToLettersFrench numbersToLettersFrench;

    setUpAll(() {
      numbersToLettersFrench = NumbersToLettersFrench();
      numbersToLettersFrench.separator = ' ';
    });

    test('0 = zéro', () {
      expect(numbersToLettersFrench.toLetters(0), equals(numbersToLettersFrench.zero));
    });

    test('1 = un', () {
      expect(numbersToLettersFrench.toLetters(1), equals('un'));
    });

    test('20 = vingt', () {
      expect(numbersToLettersFrench.toLetters(20), equals('vingt'));
    });

    test('100 = cent', () {
      expect(numbersToLettersFrench.toLetters(100), equals('cent'));
    });

    test('666 = six cent soixante six', () {
      expect(numbersToLettersFrench.toLetters(666),
          equals('six cent soixante six'));
    });

    test('1000 = mille', () {
      expect(numbersToLettersFrench.toLetters(1000), equals('mille'));
    });

    test('1001 = mille un', () {
      expect(numbersToLettersFrench.toLetters(1001), equals('mille un'));
    });

    test('1000002 = un million deux', () {
      expect(
          numbersToLettersFrench.toLetters(1000002), equals('un million deux'));
    });

    test('3001001300 = trois milliard un million mille trois cent', () {
      expect(numbersToLettersFrench.toLetters(3001001300),
          equals('trois milliard un million mille trois cent'));
    });
  });
}
