import 'package:crybse/shared/domain/models/model.dart';

abstract class FavoriteRepository {
  Future<List<Favorite>> getFavorites();
  Future<Favorite> addFavorite(Pair pair);
  Future<bool> deleteFavorite(String id);
}
