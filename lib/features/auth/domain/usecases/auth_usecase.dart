import 'package:crybse/features/auth/domain/models/user_entity.dart';
import 'package:crybse/features/auth/domain/repository/auth_repository.dart';

class AuthUsecase implements AuthRepository {
  AuthUsecase({required this.repository});

  final AuthRepository repository;
  @override
  void authStateChange(void Function(UserEntity? userEntity) callback) {
    repository.authStateChange((userEntity) {
      callback(userEntity);
    });
  }

  @override
  Future<UserEntity?> restoreSession() {
    return repository.restoreSession();
  }

  @override
  Future<UserEntity?> setSession(String token) {
    return repository.setSession(token);
  }

  @override
  Future<bool> signInWithGoogle() {
    return repository.signInWithGoogle();
  }

  @override
  Future<bool> signInWithPassword(
      {required String email, required String password}) {
    return repository.signInWithPassword(email: email, password: password);
  }

  @override
  Future<bool> signUpWithPassword(
      {required String email, required String password}) {
    return repository.signUpWithPassword(email: email, password: password);
  }

  @override
  Future<bool> signOut() {
    return repository.signOut();
  }
}
