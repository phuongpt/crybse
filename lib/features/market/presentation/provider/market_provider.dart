import 'package:crybse/features/market/domain/provider/market_repository_provider.dart';
import 'package:crybse/features/market/domain/usecases/market_usecase.dart';
import 'package:crybse/features/market/presentation/provider/state/market_notifier.dart';
import 'package:crybse/features/market/presentation/provider/state/market_state.dart';
import 'package:crybse/features/settings/presentation/provider/settings_provider.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:crybse/shared/providers/time_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketNotifierProvider = StateNotifierProvider<MarketNotifier, MarketState>((ref) {
  final settings = ref.watch(settingsProvider);
  final exchangeName = settings.maybeWhen(data: (details) => details.favoriteExchange, orElse: () => '');

  final notifier = MarketNotifier(usecase: MarketUsecase(repository: ref.read(marketRepositoryProvider)));

  if (exchangeName.isNotEmpty) {
    notifier.getPairs(exchangeName);
  }

  return notifier;
});

final pairSummaryProvider = FutureProvider.family<PairSummary, Pair>((ref, pair) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final usecase = MarketUsecase(repository: ref.read(marketRepositoryProvider));

  final pairSummary = await usecase.getPairSummary(pair.exchange, pair.pair, cancelToken: cancelToken);
  return pairSummary;
});

final graphDataProvider = FutureProvider.family<Graph, Pair>((ref, pair) async {
  final interval = ref.watch(timeDataProvider).periods;
  final fromHours = ref.watch(timeDataProvider).before;
  var before = '';
  if (fromHours.isNotEmpty) {
    before = (DateTime.now().subtract(Duration(hours: int.parse(fromHours))).toUtc().millisecondsSinceEpoch ~/ 1000).toString();
  }

  final usecase = MarketUsecase(repository: ref.read(marketRepositoryProvider));

  final graph = await usecase.getPairGraph(pair.exchange, pair.pair, periods: interval, before: before);
  return graph;
});
