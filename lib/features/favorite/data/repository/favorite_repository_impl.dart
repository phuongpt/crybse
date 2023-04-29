// ignore_for_file: avoid_dynamic_calls, inference_failure_on_function_invocation

import 'package:crybse/features/auth/domain/repository/auth_repository.dart';
import 'package:crybse/features/favorite/data/models/favorite_response.dart';
import 'package:crybse/features/favorite/domain/repository/favorite_repository.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:crybse/shared/domain/models/favorite/favorite.dart';
import 'package:crybse/shared/domain/models/market/pair/pair.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:uuid/uuid.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required this.authClient, required this.client});

  final supabase.SupabaseClient client;
  final AuthRepository authClient;
  static const String _table = 'Favorite';

  @override
  Future<Favorite> addFavorite(Pair pair) async {
    final userId = authClient.currentUser?.id;
    if (userId == null) {
      throw Exception(DataExceptionMessageCode.UserNotFound);
    }
    final entity = Favorite(userId: userId, pair: pair.pair, exchange: pair.exchange, id: const Uuid().v4());
    final result = await client.from(_table).insert(entity.toJson()).select().withConverter(FavoriteResponse.toSingle);
    return result;
  }

  @override
  Future<bool> deleteFavorite(String id) async {
    await client.from(_table).delete().eq('$_table.id', id);
    return true;
  }

  @override
  Future<List<Favorite>> getFavorites() async {
    final userId = authClient.currentUser?.id;
    if (userId == null) {
      throw Exception(DataExceptionMessageCode.UserNotFound);
    }
    final result = await client.from(_table).select().eq('userId', userId).withConverter(FavoriteResponse.toList);
    return result;
  }
}
