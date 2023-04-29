// ignore_for_file: inference_failure_on_collection_literal

import 'package:crybse/features/favorite/domain/usecases/favorite_usecase.dart';
import 'package:crybse/features/favorite/presentation/providers/state/favorite_state.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier({required this.usecase}) : super(const FavoriteState.initial());

  final FavoriteUsecase usecase;

  Future<void> refresh() async {
    state = const FavoriteState.initial();
    return getFavorites();
  }

  Future<void> getFavorites() async {
    try {
      final results = await usecase.getFavorites();
      state = FavoriteState.data(data: results);
    } on DataException catch (_) {
      state = FavoriteState.error(error: _.message);
    } catch (_) {
      state = FavoriteState.error(error: DataException.fromApplicationError(_).message);
    }
  }

  Future<void> deleteFavorite(String id) async {
    try {
      final deleted = await usecase.deleteFavorite(id);
      if (deleted) {
        final data = state.maybeWhen(orElse: () => [] as List<Favorite>, data: (data) => data);
        state = FavoriteState.data(data: data.where((element) => element.id != id).toList());
      }
    } on DataException catch (_) {
      state = FavoriteState.error(error: _.message);
    } catch (_) {
      state = FavoriteState.error(error: DataException.fromApplicationError(_).message);
    }
  }

  Future<void> addFavorite(Pair pair) async {
    try {
      final favorite = await usecase.addFavorite(pair);
      final data = state.maybeWhen(orElse: () => [] as List<Favorite>, data: (data) => data);
      state = FavoriteState.data(data: [...data, favorite]);
    } on DataException catch (_) {
      state = FavoriteState.error(error: _.message);
    } catch (_) {
      state = FavoriteState.error(error: DataException.fromApplicationError(_).message);
    }
  }
}
