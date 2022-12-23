/// Collection of keys for icons.
class IconKeys {
  /// Factory constructor for singleton structure.
  factory IconKeys() => _instance;
  IconKeys._();

  static final IconKeys _instance = IconKeys._();

  /// Static instance getter of [IconKeys].
  static IconKeys get instance => _instance;

  static const String logo = 'assets/images/logo-dblue.png';
  static const String locationMarker = 'assets/images/location_marker.png';
  static const String learnIllustration =
      'assets/images/learn-illustration.png';
  static const String userProfile = 'assets/images/user-profile.png';

  static const List<String> lsIcons = <String>[
    '',
    'assets/images/ls-icon-1.png',
    'assets/images/ls-icon-2.png',
    'assets/images/ls-icon-3.png',
    'assets/images/ls-icon-4.png',
    'assets/images/ls-icon-5.png',
    'assets/images/ls-icon-6.png',
    'assets/images/ls-icon-7.png',
    'assets/images/ls-icon-8.png',
    'assets/images/ls-icon-9.png',
    'assets/images/ls-icon-10.png',
    'assets/images/ls-icon-11.png',
    'assets/images/ls-icon-12.png',
    'assets/images/ls-icon-13.png',
    'assets/images/ls-icon-14.png',
    'assets/images/ls-icon-15.png',
    'assets/images/ls-icon-16.png',
    'assets/images/ls-icon-17.png',
    'assets/images/ls-icon-18.png',
    'assets/images/ls-icon-19.png',
    'assets/images/ls-icon-20.png',
  ];

  //For Demo User Profile Pages
  static const String profilePageAltay = 'assets/images/image-altay.jpg';
  static const String profilePageBahrican = 'assets/images/image-bahrican.jpg';
  static const String profilePageBatuhan = 'assets/images/image-batuhan.jpg';
  static const String profilePageEzgi = 'assets/images/image-ezgi.jpg';
  static const String profilePageEnes = 'assets/images/image-enes.jpg';
  static const String profilePageEgemen = 'assets/images/image-egemen.jpg';
  static const String profilePageEce = 'assets/images/image-ece.jpg';
  static const String profilePageHasan = 'assets/images/image-hasan.jpg';
  static const String profilePageOnur = 'assets/images/image-onur.jpg';
  static const String profilePageGokay = 'assets/images/image-gökay.jpg';
  static const String profilePageKoray = 'assets/images/image-koray.jpg';
}
