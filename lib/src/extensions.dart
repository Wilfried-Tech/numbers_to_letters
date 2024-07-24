extension StringExtension on String {
  String reverse() {
    return split('').reversed.join();
  }
  bool matches(String s) => RegExp(s).hasMatch(this);
  bool isInteger() => matches(r'^-?\d+$');
}
