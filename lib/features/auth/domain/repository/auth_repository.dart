import 'package:crybse/features/auth/domain/models/user_entity.dart';

///
abstract class AuthRepository {
  /// Sign in with Google
  Future<bool> signInWithGoogle();

  /// Sign in with Password
  Future<bool> signInWithPassword(
      {required String email, required String password});

  /// Sign in with Password
  Future<bool> signUpWithPassword(
      {required String email, required String password});

  /// Sign out
  Future<bool> signOut();

  /// Listen to auth changes
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  );

  /// Store token
  Future<UserEntity?> setSession(String token);

  /// restore session from token
  Future<UserEntity?> restoreSession();
}
