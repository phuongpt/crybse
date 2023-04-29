import 'package:crybse/features/auth/data/datasource/secure_local_storage.dart';
import 'package:crybse/features/auth/data/repository/auth_repository_impl.dart';
import 'package:crybse/features/auth/domain/provider/supabase_provider.dart';
import 'package:crybse/features/auth/domain/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  return AuthRepositoryImpl(
    SecureLocalStorage(),
    authClient,
  );
});
