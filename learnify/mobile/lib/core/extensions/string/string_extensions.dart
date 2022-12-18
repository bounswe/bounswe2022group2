import 'package:collection/collection.dart';

import '../../../product/language/language_options.dart';
import '../../widgets/text/base_text.dart';

/// Utility extensions for [String] class.
extension StringUtilExtensions on String {
  /// Capitalizes the string.
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${toLowerCase().substring(1)}';

  /// Capitalizes the all words in a string.
  String get capitalizeAllWords => split(' ').map((String word) {
        if (word.isEmpty) return this;
        final String leftText =
            (word.length > 1) ? word.substring(1, word.length) : '';
        return word[0].toUpperCase() + leftText;
      }).join(' ');

  /// Language
  LanguageOptions? get languageEnum => LanguageOptions.values
      .firstWhereOrNull((LanguageOptions l) => l.name.compareWithoutCase(this));

  /// Replaces the "{}" texts with corresponding values.
  List<ReplaceValue> putValues(List<ReplaceValue> values) {
    String tempText = toString();
    final List<ReplaceValue> localValues = values.toList();
    final List<ReplaceValue> allValues = <ReplaceValue>[];
    while (true) {
      final int openIndex = tempText.indexOf('{');
      final int closeIndex = tempText.indexOf('}');
      if (openIndex == -1 || closeIndex == -1) {
        allValues.add(ReplaceValue(tempText, translate: false));
        break;
      }
      final String beforeText = tempText.substring(0, openIndex);
      allValues
        ..add(ReplaceValue(beforeText, translate: false))
        ..add(localValues[0]);
      tempText = tempText.substring(closeIndex + 1);
      localValues.removeAt(0);
    }
    return allValues;
  }
}

/// Utility functions on nullable strings.
extension NullableStringUtility on String? {
  /// Compares two strings by ignoring case differences.
  bool compareWithoutCase(String? otherString) {
    if (otherString == null || this == null) return false;
    return otherString.toLowerCase() == this!.toLowerCase();
  }

  /// Converts the string to an enum according to the given list of values.
  T? toEnum<T extends Enum>(List<T> values) => values
      .firstWhereOrNull((T e) => e.name.toLowerCase() == this?.toLowerCase());
}
