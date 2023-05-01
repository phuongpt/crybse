import 'package:crybse/shared/core/validators/string_validator.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Please input your password';
      case tooShort:
        return 'Password is too short';
      case invalid:
        return 'Must contain at least 1 characters and 1 symbol';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(super.value) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return PasswordValidationError.tooShort;
    }

    // if (!PasswordSubmitRegexValidator().isValid(value)) {
    //   return PasswordValidationError.invalid;
    // }

    return null;
  }
}
