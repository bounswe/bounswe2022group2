import 'dart:developer';

import 'package:url_launcher/url_launcher.dart' as launcher;

/// Helper for url launcher package.
mixin UrlLauncherHelper {
  /// Launches the url.
  static Future<bool> launch(String? url) async {
    if (url == null) {
      log("ERROR[URL_LAUNCHER] => Given url is null.");
      return false;
    }
    final Uri uri = Uri.parse(url);
    final bool res = await launcher.launchUrl(uri);
    if (!res) log("ERROR[URL_LAUNCHER] => Couldn't launch the url: $url");
    return res;
  }
}
