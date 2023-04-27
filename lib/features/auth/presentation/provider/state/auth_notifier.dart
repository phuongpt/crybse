import 'package:crybse/features/auth/domain/repository/auth_repository.dart';
import 'package:crybse/features/auth/presentation/provider/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_links/uni_links.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required this.repository}) : super(const AuthState.initial()) {
    _initialize();
  }
  final AuthRepository repository;

  Future<void> _handleInitialDeepLink() async {
    final initialLink = await getInitialLink();
    if (!(initialLink?.contains('refresh_token=') ?? false)) {
      return;
    }

    final refreshTokenQueryParam = initialLink?.split('&').firstWhere((element) => element.contains('refresh_token'));

    final refreshToken = refreshTokenQueryParam?.substring(refreshTokenQueryParam.indexOf('=') + 1);
    if (refreshToken == null) return;

    final res = await repository.setSession(refreshToken);
    state.maybeWhen(orElse: () => null, data: (data) => res);
  }

  ///
  Future<void> _initialize() async {
    /// try to restore saved session
    final res = await repository.restoreSession();
    state.maybeWhen(orElse: _handleInitialDeepLink, data: (data) => res);

    /// listen to auth changes
    repository.authStateChange((user) {
      state.maybeWhen(orElse: () => null, data: (data) => user);
    });
  }
}
