import 'package:crybse/shared/validators/string_validator.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Please input your email!';
      case invalid:
        return 'Please input a valid email!';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(super.value) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.length < 4) return EmailValidationError.empty;

    if (!EmailSubmitRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
