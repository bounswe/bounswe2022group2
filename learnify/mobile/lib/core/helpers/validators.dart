/// Callback definition of a validator.
// ignore_for_file: unused_element

typedef ValidatorCallback = String? Function(String val);

/// [Validators] gather all validation functions, regexes in one file.
class Validators {
  /// Provides specific validations by also using common functions
  /// such as [lengthCheck], [_upperCaseCheck] and so on.
  const Validators();

  /// Regex for name input, also considers internation chars.
  static const String _nameRegex =
      r"""^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ðıİşŞÜüĞğÇçÖö ,.'-]+$""";

  /// Regex for email input.
  static const String _emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String _ipRegex =
      r"^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";

  /// usernameRegex
  static const String _usernameRegex = r"^[a-z0-9_]{3,15}$";

  /// Validation for email, checks firstly the length and then the content.
  static String? email(String? email) {
    String? errorMessage = lengthCheck(email, 3);
    if (errorMessage != null) return errorMessage;
    errorMessage = _runValidations(email, <ValidatorCallback>[_spaceCheck]);
    if (errorMessage != null) return errorMessage;
    final bool isValid = RegExp(_emailRegex).hasMatch(email!);
    if (!isValid) return 'Please enter a valid email';
    return null;
  }

  /// Validation for ip, checks firstly the length and then the content.
  static String? ip(String? ip) {
    String? errorMessage = lengthCheck(ip, 4);
    if (errorMessage != null) return errorMessage;
    errorMessage = _runValidations(ip, <ValidatorCallback>[_spaceCheck]);
    if (errorMessage != null) return errorMessage;
    final bool isValid = RegExp(_ipRegex).hasMatch(ip!);
    if (!isValid) return 'Please enter a valid ip';
    return null;
  }

  /// Validation for ip, checks firstly the length and then the content.
  static String? username(String? usernameText) {
    String? errorMessage = lengthCheck(usernameText, 2);
    if (errorMessage != null) return errorMessage;
    errorMessage =
        _runValidations(usernameText, <ValidatorCallback>[_spaceCheck]);
    if (errorMessage != null) return errorMessage;
    final bool isValid = RegExp(_usernameRegex).hasMatch(usernameText!);
    if (!isValid) return 'Please enter a valid username';
    return null;
  }

  /// Validation for password, checks firstly the length and then the content.
  /// Uses [_spaceCheck], [_upperCaseCheck], [_lowerCaseCheck], and
  /// [_numberCheck] and returns corresponding error message.
  static String? password(String? password) {
    String? errorMessage = lengthCheck(password, 8);
    if (errorMessage != null) return errorMessage;
    final String? validationError = _runValidations(
        password, <ValidatorCallback>[
      _spaceCheck,
      _upperCaseCheck,
      _lowerCaseCheck,
      _numberCheck
    ]);
    return errorMessage ??= validationError;
  }

  /// Validation for name, checks firstly the length and then the content.
  static String? name(String? name) {
    String? errorMessage = lengthCheck(name, 2);
    if (errorMessage != null) return '    $errorMessage';
    errorMessage = _runValidations(name);
    if (errorMessage == null) {
      final bool isValid = RegExp(_nameRegex).hasMatch(name!);
      if (!isValid) errorMessage = 'Please enter a valid name';
    }
    return errorMessage;
  }

  static String? _runValidations(String? text,
      [List<ValidatorCallback> validations = const <ValidatorCallback>[]]) {
    for (int i = 0; i < validations.length; i++) {
      if (validations[i](text!) != null) {
        return validations[i](text);
      }
    }
    return null;
  }

  /// Checks whether the given [text] is longer than or equal to the [length].
  static String? lengthCheck(String? text, int length) {
    final String lengthError =
        'Must be longer than or equal to $length characters';
    if (text == null || text.length < length) return lengthError;
    return null;
  }

  /// Checks whether the given [text] contains at least one upper case char.
  static String? _upperCaseCheck(String text) {
    final bool containsUpperCase =
        RegExp(r'^(?=.*?[A-Z]).{1,}$').hasMatch(text);
    if (!containsUpperCase) return 'Must contain upper case character.';
    return null;
  }

  /// Checks whether the given [text] contains at least one lower case char.
  static String? _lowerCaseCheck(String text) {
    final bool containsLowerCase =
        RegExp(r'^(?=.*?[a-z]).{1,}$').hasMatch(text);
    if (!containsLowerCase) return 'Must contain lower case character.';
    return null;
  }

  /// Checks whether the given [text] contains at least one number.
  static String? _numberCheck(String text) {
    final bool containsNumber = RegExp(r'^(?=.*?[0-9]).{1,}$').hasMatch(text);
    if (!containsNumber) return 'Must contain at least one number.';
    return null;
  }

  /// Checks whether the given [text] contains any space.
  static String? _spaceCheck(String text) {
    final bool containsSpace = RegExp(r"\s\b|\b\s").hasMatch(text);
    if (containsSpace) return 'Must not contain any white space.';
    return null;
  }
}
