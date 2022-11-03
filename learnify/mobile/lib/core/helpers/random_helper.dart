import 'dart:math';

/// Helper for randomness.
mixin RandomHelper {
  static const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static String randomString({int? length}) {
    final Random rnd = Random();
    return String.fromCharCodes(Iterable<int>.generate(
        length ?? Random().nextInt(80) + 20,
        (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
  }
}
