import '../../providers/language/app_localizations.dart';

extension UtilExtension on String {
  String get tr => AppLocalizations.instance?.translate(this) ?? this;
}
