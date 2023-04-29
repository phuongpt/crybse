import 'package:crybse/features/favorite/domain/providers/favorite_repository_provider.dart';
import 'package:crybse/features/favorite/domain/usecases/favorite_usecase.dart';
import 'package:crybse/features/favorite/presentation/providers/state/favorite_notifier.dart';
import 'package:crybse/features/favorite/presentation/providers/state/favorite_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteNotifierProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  final notifier = FavoriteNotifier(usecase: FavoriteUsecase(repository: ref.watch(favoriteRepositoryProvider)))..getFavorites();
  return notifier;
});
