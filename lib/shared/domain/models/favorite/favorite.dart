import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite.g.dart';
part 'favorite.freezed.dart';

@freezed
abstract class Favorite with _$Favorite {
  const factory Favorite({
    String? id,
    required String userId,
    required String exchange,
    required String pair,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}
