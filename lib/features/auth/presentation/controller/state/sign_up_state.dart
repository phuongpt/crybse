import 'package:crybse/features/auth/presentation/form/email_form.dart';
import 'package:crybse/features/auth/presentation/form/password_form.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(PasswordFormz.pure()) PasswordFormz confirmPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    @Default('') String message,
  }) = _SignUpState;
}
