/// Collection of keys for icons.
class IconKeys {
  /// Factory constructor for singleton structure.
  factory IconKeys() => _instance;
  IconKeys._();

  static final IconKeys _instance = IconKeys._();

  /// Static instance getter of [IconKeys].
  static IconKeys get instance => _instance;

  static const String logo = 'assets/images/logo-dblue.png';
  static const String learnIllustration =
      'assets/images/learn-illustration.png';
}
