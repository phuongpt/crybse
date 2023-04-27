import 'package:crybse/features/auth/domain/providers/auth_provider.dart';
import 'package:crybse/features/auth/presentation/provider/state/auth_notifier.dart';
import 'package:crybse/features/auth/presentation/provider/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(repository: ref.read(authRepositoryProvider));
});
