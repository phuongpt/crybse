import 'package:crybse/features/auth/domain/provider/auth_provider.dart';
import 'package:crybse/features/auth/domain/provider/supabase_provider.dart';
import 'package:crybse/features/favorite/data/repository/favorite_repository_impl.dart';
import 'package:crybse/features/favorite/domain/repository/favorite_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  final authClient = ref.watch(authRepositoryProvider);
  final respository = FavoriteRepositoryImpl(client: client, authClient: authClient);
  return respository;
});
