import 'package:crybse/features/auth/presentation/forms/email_form.dart';
import 'package:crybse/features/auth/presentation/forms/password_form.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    @Default('') String message,
  }) = _SignInState;
}
