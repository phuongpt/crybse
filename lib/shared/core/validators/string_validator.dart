abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      final regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);

      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }

      return false;
    } catch (e) {
      assert(false, e.toString());
      return true;
    }
  }
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator() : super(regexSource: r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
}

class PasswordSubmitRegexValidator extends RegexValidator {
  PasswordSubmitRegexValidator() : super(regexSource: r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*();:,."-_/#?&])[A-Za-z\d@$!%*();:,."-_/#?&]{8,}$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}
