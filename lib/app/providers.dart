import 'package:crybse/features/auth/domain/providers/supabase_provider.dart';
import 'package:crybse/features/auth/presentation/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<ProviderContainer> initializeProviders(ProviderContainer container) async {
  /// Core
  await container.read(supabaseProvider.future);

  /// Auth
  container.read(authNotifierProvider);
  return container;
}
