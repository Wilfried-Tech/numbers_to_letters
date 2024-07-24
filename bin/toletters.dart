import 'package:numbers_to_letters/numbers_to_letters.dart';

void main(List<String> args) {
  if (args.length >= 2) {
    for (final arg in args.skip(1)) {
      print('$arg = ${NumbersToLetters.toLetters(args[0], arg)}');
    }
  } else {
    print('Usage: toletters <language> <number> [<number> ...]');
  }
}
 