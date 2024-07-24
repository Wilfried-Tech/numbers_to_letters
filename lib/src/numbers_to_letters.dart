import 'numbers_to_letters_fr.dart';
import 'numbers_to_letters_en.dart';
import 'numbers_to_letters_base.dart';

class NumbersToLetters {
  static final Map<String, NumbersToLettersBase> _plugins = {
    'fr': NumbersToLettersFrench(),
    'en': NumbersToLettersEnglish(''),
    'en-gb': NumbersToLettersEnglish('gb'),
  };

  static void registerLanguage(String lang, NumbersToLettersBase plugin) {
    _plugins.update(lang, (_) => plugin, ifAbsent: () => plugin);
  }

  static NumbersToLettersBase? removeLanguage(String lang) =>
      _plugins.remove(lang);

  static List<String> avaiableLanguages() =>
      _plugins.keys.toList(growable: false);

  static NumbersToLettersBase getPlugin(String lang) {
    lang = lang.toLowerCase();
    if (_plugins.containsKey(lang)) {
      return _plugins[lang]!;
    } else {
      throw UnsupportedError(
          'Language $lang is not yet supported\nyou can add it as plugin');
    }
  }

  static set separator(String separator) {
    _plugins.forEach((key, value) {
      value.separator = separator;
    });
  }

  static toLetters(String lang, Object number) {
    lang = lang.toLowerCase();
    if (_plugins.containsKey(lang)) {
      return _plugins[lang]!.toLetters(number);
    } else {
      throw UnsupportedError(
          'Language $lang is not yet supported\nyou can add it as plugin');
    }
  }
}
