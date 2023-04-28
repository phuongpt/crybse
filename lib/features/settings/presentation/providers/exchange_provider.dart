import 'package:crybse/features/market/domain/provider/market_repository_provider.dart';
import 'package:crybse/features/market/domain/usecases/market_usecase.dart';
import 'package:crybse/shared/domain/models/exchanges/exchanges.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exchangesProvider = FutureProvider<List<Exchange>>((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final usecase = MarketUsecase(repository: ref.read(marketRepositoryProvider));

  final exchanges = await usecase.getExchanges(cancelToken: cancelToken);
  return exchanges;
});
