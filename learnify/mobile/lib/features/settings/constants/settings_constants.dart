import 'package:flutter/widgets.dart';

import '../../../product/language/language_keys.dart';

/// Collection of texts in the settings screen.
mixin SettingsTexts on StatelessWidget {
  /// Information sentences with colored words in the settings screen.
  static const Map<String, List<String>> infoSentences = <String, List<String>>{
    TextKeys.appInfo: <String>[
      TextKeys.learnify,
      TextKeys.throughCollaboration,
      TextKeys.comment,
      TextKeys.notes,
      TextKeys.annotations,
    ],
  };

  /// Social media accounts.
  static final List<SocialMediaModel> socialMediaAccounts = <SocialMediaModel>[
    SocialMediaModel(nameKey: 'email', link: _emailUri.toString()),
    const SocialMediaModel(
        nameKey: 'github',
        link: 'https://github.com/bounswe/bounswe2022group2'),
    const SocialMediaModel(
        nameKey: 'we',
        link:
            'https://user-images.githubusercontent.com/64018144/194706872-8b4e83cc-503b-4165-a7be-003430276dc9.jpg'),
    const SocialMediaModel(
        nameKey: 'linkedin',
        link: 'https://www.linkedin.com/school/bogazici-university/'),
  ];

  static Uri get _emailUri => Uri(
        scheme: 'mailto',
        path: 'learnify451@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Hello From Learnify App!',
        }),
      );

  static String? _encodeQueryParameters(Map<String, String> params) =>
      params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

  /// Made with 💙 by Learnify Team.
  static const String madeBy = ' Made with 💙 by Learnify Team';
}

/// Model for social media accounts.
class SocialMediaModel {
  /// Default constructor for [SocialMediaModel].
  const SocialMediaModel({required this.nameKey, required this.link});

  /// Key for the name of the social media type.
  final String nameKey;

  /// Link to the social media.
  final String link;
}
