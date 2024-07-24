<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# numbers_to_letters

![Pub Version](https://img.shields.io/pub/v/numbers_to_letters)
![GitHub](https://img.shields.io/github/license/Wilfried-Tech/numbers_to_letters)
![GitHub stars](https://img.shields.io/github/stars/Wilfried-Tech/numbers_to_letters?style=social)
![GitHub forks](https://img.shields.io/github/forks/Wilfried-Tech/numbers_to_letters?style=social)

NumbersToLetters is a package that converts numbers to letters in multiple languages.

## :hammer_and_wrench: Features

- Convert numbers to letters in multiple languages.
- Developers can add their own languages.

## :man_technologist: Getting started

To use this package, add `numbers_to_letters` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  numbers_to_letters: ^1.0.0
```

## :memo: Usage

This is a simple usage example:

```dart
import 'package:numbers_to_letters/numbers_to_letters.dart';

void main() {
  print(NumbersToLetters.toLetters('en', 1234)); // one thousand two hundred and thirty-four
}
```

you can change the word separator with separator setter

```dart
...
NumbersToLetters.separator = ' ';
...
```

Developers can add their own languages by extending the `NumbersToLettersBase` class.

```dart

class NumbersToLettersCustom extends NumbersToLettersBase {
    ...
}

void main() {
    NumbersToLetters.registerLanguage('custom', NumbersToLettersCustom());
    ...
    print(NumbersToLetters.toLetters('custom', 1234));
}
```

## Supported languages

- [X] English
- [X] French
- [ ] Spanish
- [ ] German

## :hugs: Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Request a new language by creating a new class that extends `NumbersToLettersBase`, write correponding tests and open a pull request. Then, add the language to the README.

I will be happy to merge it. add it to the package.

## :heart: Donation

If this project help you reduce time to develop, you can give me a cup of coffee :) by give me a star.
