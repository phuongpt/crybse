import 'package:crybse/features/favorite/domain/repository/favorite_repository.dart';
import 'package:crybse/shared/domain/models/model.dart';

class FavoriteUsecase implements FavoriteRepository {
  FavoriteUsecase({required this.repository});
  final FavoriteRepository repository;

  @override
  Future<Favorite> addFavorite(Pair pair) {
    return repository.addFavorite(pair);
  }

  @override
  Future<bool> deleteFavorite(String id) {
    return repository.deleteFavorite(id);
  }

  @override
  Future<List<Favorite>> getFavorites() {
    return repository.getFavorites();
  }
}
