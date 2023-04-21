import 'package:crybse/features/market/data/datasource/market_remote_datasource.dart';
import 'package:crybse/features/market/data/repository/market_repository_impl.dart';
import 'package:crybse/features/market/domain/repositories/crypto_repository_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketRepositoryProvider = Provider<MarketRepository>((ref) {
  final datasource = MarketRemoteDatasource();
  final respository = MarketRepositoryImpl(remoteDataSource: datasource);
  return respository;
});
