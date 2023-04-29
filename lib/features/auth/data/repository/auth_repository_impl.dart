import 'dart:developer';

import 'package:crybse/features/auth/data/datasource/secure_local_storage.dart';
import 'package:crybse/features/auth/domain/models/user_entity.dart';
import 'package:crybse/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Repository that handles authorization and persists session
class AuthRepositoryImpl implements AuthRepository {
  /// Default constructor
  AuthRepositoryImpl(this.secureLocalStorage, this.authClient);

  /// local token storage provider
  final SecureLocalStorage secureLocalStorage;

  /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes
  final supabase.GoTrueClient authClient;

  /// Current authorized User
  @override
  UserEntity? get currentUser => authClient.currentUser == null ? null : UserEntity.fromJson(authClient.currentUser!.toJson());

  @override
  Future<UserEntity?> restoreSession() async {
    final res = await secureLocalStorage.accessToken();
    if (res == null) {
      return null;
    }

    final response = await authClient.recoverSession(res);

    if (response.session != null) {
      await secureLocalStorage.persistSession(response.session?.persistSessionString ?? '');

      return UserEntity.fromJson(response.user!.toJson());
    }
    await secureLocalStorage.removePersistedSession();
    return null;
  }

  @override
  Future<UserEntity?> setSession(String token) async {
    final response = await authClient.setSession(token);

    if (response.session != null) {
      await secureLocalStorage.persistSession(response.session?.persistSessionString ?? '');

      return UserEntity.fromJson(response.user!.toJson());
    }

    await secureLocalStorage.removePersistedSession();
    return null;
  }

  @override
  Future<bool> signInWithGoogle() async {
    final res = await authClient.signInWithOAuth(
      supabase.Provider.google,
      redirectTo: 'io.supabase.flutter://reset-callback/',
    );
    return res;
  }

  @override
  Future<bool> signOut() async {
    await secureLocalStorage.removePersistedSession();

    await authClient.signOut();
    return true;
  }

  @override
  Future<bool> signInWithPassword({required String email, required String password}) async {
    final res = await authClient.signInWithPassword(email: email, password: password);
    return res.session != null;
  }

  @override
  Future<bool> signUpWithPassword({required String email, required String password}) async {
    final res = await authClient.signUp(email: email, password: password);
    return res.session != null;
  }

  // Returns Stream with auth user changes
  @override
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  ) {
    authClient.onAuthStateChange.listen((data) {
      switch (data.event) {
        case supabase.AuthChangeEvent.signedIn:
          callback(
            UserEntity.fromJson(data.session!.user.toJson()),
          );
          break;
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
          break;
        case supabase.AuthChangeEvent.userUpdated:
          callback(
            UserEntity.fromJson(data.session!.user.toJson()),
          );
          break;
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
          break;
        case supabase.AuthChangeEvent.userDeleted:
          signOut();
          break;
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          break;
      }
    });
  }
}
