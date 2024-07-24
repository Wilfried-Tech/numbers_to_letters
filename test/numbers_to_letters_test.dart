import 'package:numbers_to_letters/src/numbers_to_letters.dart';
import 'package:test/test.dart';

void main() {
  group('NumbersToLetters', () {
    test('fr', () {
      expect(NumbersToLetters.toLetters('fr', 1000), equals('mille'));
    });
    test('ab', () {
      expect(
        () => NumbersToLetters.toLetters('ab', 1000),
        throwsUnsupportedError,
      );
    });
  });
}
