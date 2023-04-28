import 'package:crybse/shared/domain/models/model.dart';

class FavoriteResponse {
  static List<Favorite> toList(dynamic data) {
    return (data as List<dynamic>).map((e) => Favorite.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Favorite toSingle(dynamic data) {
    return Favorite.fromJson(
      (data as List).first as Map<String, dynamic>,
    );
  }
}
