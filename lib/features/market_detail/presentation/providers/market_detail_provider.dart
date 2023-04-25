import 'package:crybse/features/market/domain/provider/market_provider.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pairOrderBookProvider = FutureProvider.family<OrderBook, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final orderBook = await ref.read(marketRepositoryProvider).getOrderBook(pair.exchange, pair.pair, cancelToken: cancelToken);

  return orderBook;
});

final tradesProvider = FutureProvider.family<List<Trade>, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final trades = await ref.read(marketRepositoryProvider).getTrades(pair.exchange, pair.pair, cancelToken: cancelToken);
  return trades;
});
