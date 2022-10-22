/// Collection of keys for icons.
class LinkKeys {
  /// Factory constructor for singleton structure.
  factory LinkKeys() => _instance;
  LinkKeys._();

  static final LinkKeys _instance = LinkKeys._();

  /// Static instance getter of [LinkKeys].
  static LinkKeys get instance => _instance;

  static const String logo = 'assets/images/logo.png';

  /// Privacy policy screen url.
  static const String privacyPolicy =
      'https://github.com/bounswe/bounswe2022group2';

  /// Terms and conditions screen url.
  static const String termsAndConditions =
      'https://github.com/bounswe/bounswe2022group2';
}
