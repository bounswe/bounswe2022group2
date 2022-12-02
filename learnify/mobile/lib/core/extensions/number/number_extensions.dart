/// Utility extensions for [num] class.
extension NumberExtension on num {
  String get minsToString {
    final Duration d = Duration(minutes: toInt());
    final List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
  }
}
