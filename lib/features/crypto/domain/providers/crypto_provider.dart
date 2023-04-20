import 'package:crybse/features/settings/providers/settings_provider.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:crybse/shared/domain/helpers/helper.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:crybse/shared/providers/providers.dart';
import 'package:crybse/shared/providers/time_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pairsProvider = FutureProvider<List<Pair>>((ref) async {
  final settings = ref.watch(cryptoSettingsProvider);
  final exchangeName =
      settings.maybeWhen(data: (details) => details.favoriteExchange, orElse: () => throw DataException(message: LocaleKeys.errorSomethingWentWrong));
  final pairs = await ref.read(cryptoRepository).getPairs(exchangeName);
  return pairs;
});

final exchangesProvider = FutureProvider<List<Exchange>>((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final exchanges = await ref.read(cryptoRepository).getExchanges(cancelToken: cancelToken);
  return exchanges;
});

final favoritePairProvider = FutureProvider<FavoritePair>((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final settings = ref.watch(cryptoSettingsProvider);
  final exchangeName = settings.maybeWhen(data: (details) => details.favoriteExchange, orElse: () => '');
  final pair = settings.maybeWhen(data: (details) => details.favoritePair, orElse: () => '');

  if (exchangeName.isEmpty || pair.isEmpty) {
    throw DataException(message: LocaleKeys.errorSomethingWentWrong);
  }

  try {
    final pairSummary = await ref.read(cryptoRepository).getPairSummary(exchangeName, pair, cancelToken: cancelToken);
    return FavoritePair(
      pair: Pair(pair: pair, exchange: exchangeName, pairName: Helper.convertPairName(pair)),
      pairSummary: pairSummary,
    );
  } on DataException catch (error) {
    if (error.message == LocaleKeys.errorRequestNotFound) {
      await ref.read(cryptoSettingsProvider.notifier).verifyFavoritePair();
    }
    rethrow;
  }
});

final pairSummaryProvider = FutureProvider.family<PairSummary, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final pairSummary = await ref.read(cryptoRepository).getPairSummary(pair.exchange, pair.pair, cancelToken: cancelToken);
  return pairSummary;
});

final pairOrderBookProvider = FutureProvider.family<OrderBook, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final orderBook = await ref.read(cryptoRepository).getOrderBook(pair.exchange, pair.pair, cancelToken: cancelToken);

  return orderBook;
});

final tradesProvider = FutureProvider.family<List<Trade>, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final trades = await ref.read(cryptoRepository).getTrades(pair.exchange, pair.pair, cancelToken: cancelToken);
  return trades;
});

final graphDataProvider = FutureProvider.family<Graph, Pair>((ref, pair) async {
  final interval = ref.watch(timeDataProvider).periods;
  final fromHours = ref.watch(timeDataProvider).before;
  var before = '';
  if (fromHours.isNotEmpty) {
    before = (DateTime.now().subtract(Duration(hours: int.parse(fromHours))).toUtc().millisecondsSinceEpoch ~/ 1000).toString();
  }

  final graph = await ref.read(cryptoRepository).getPairGraph(pair.exchange, pair.pair, periods: interval, before: before);
  return graph;
});
