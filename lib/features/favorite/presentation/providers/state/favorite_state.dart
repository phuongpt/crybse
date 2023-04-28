import 'package:crybse/shared/domain/models/favorite/favorite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _FavoriteStateInitial;
  const factory FavoriteState.loading() = _FavoriteStateLoading;
  const factory FavoriteState.data({required List<Favorite> data}) = _FavoriteStateData;
  const factory FavoriteState.error({String? error}) = _FavoriteStateError;
}
