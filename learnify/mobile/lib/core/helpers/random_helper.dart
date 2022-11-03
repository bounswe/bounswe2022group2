import 'dart:math';

/// Helper for randomness.
mixin RandomHelper {
  static const String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static String randomString({int? min, int? max}) {
    final Random rnd = Random();
    final int minAssigned = min ?? 20;
    return String.fromCharCodes(Iterable<int>.generate(
        Random().nextInt((max ?? 100) - minAssigned) + minAssigned,
        (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
  }
}
