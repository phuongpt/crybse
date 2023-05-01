import 'dart:developer';

import 'package:crybse/features/auth/domain/provider/auth_provider.dart';
import 'package:crybse/features/auth/domain/usecases/auth_usecase.dart';
import 'package:crybse/features/auth/presentation/controller/state/sign_up_state.dart';
import 'package:crybse/features/auth/presentation/form/email_form.dart';
import 'package:crybse/features/auth/presentation/form/password_form.dart';
import 'package:crybse/shared/core/constants/exceptions.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(this.authUsecase) : super(const SignUpState());

  final AuthUsecase authUsecase;

  bool validate({EmailFormz? email, PasswordFormz? password, PasswordFormz? confirmPassword}) {
    return Formz.validate([email ?? state.email, password ?? state.password, confirmPassword ?? state.confirmPassword]);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(email: email, isValid: validate(email: email), message: '');
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    state = state.copyWith(password: password, isValid: validate(password: password), message: '');
  }

  void updateConfirmPassword(String value) {
    final confirmPassword = PasswordFormz.dirty(value);
    state = state.copyWith(confirmPassword: confirmPassword, isValid: validate(confirmPassword: confirmPassword), message: '');
  }

  Future<void> signUpWithPassword() async {
    if (!state.isValid) return;
    state = state.copyWith(status: FormzSubmissionStatus.inProgress, message: '');
    try {
      await authUsecase.signUpWithPassword(
        email: state.email.value,
        password: state.password.value,
      );
      state = state.copyWith(status: FormzSubmissionStatus.success, message: 'Sign up successfully!');
    } on AuthException catch (_) {
      state = state.copyWith(status: FormzSubmissionStatus.failure, message: DataException.fromAuthError(_).message);
    } catch (_) {
      state = state.copyWith(status: FormzSubmissionStatus.failure, message: DataException.fromApplicationError(_).message);
    }
  }
}

final signUpNotifierProvider = StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(
    AuthUsecase(repository: ref.read(authRepositoryProvider)),
  ),
);
