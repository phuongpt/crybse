import 'package:crybse/features/market/domain/provider/market_repository_provider.dart';
import 'package:crybse/features/market/domain/usecases/market_usecase.dart';
import 'package:crybse/features/settings/presentation/provider/settings_provider.dart';
import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/shared/core/constants/exceptions.dart';
import 'package:crybse/shared/core/helpers/pair_helper.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoritePairProvider = FutureProvider<FavoritePair>((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final settings = ref.watch(settingsProvider);
  final exchangeName = settings.maybeWhen(data: (details) => details.favoriteExchange, orElse: () => '');
  final pair = settings.maybeWhen(data: (details) => details.favoritePair, orElse: () => '');

  if (exchangeName.isEmpty || pair.isEmpty) {
    throw DataException(message: LocaleKeys.errorSomethingWentWrong);
  }

  try {
    final usecase = MarketUsecase(repository: ref.read(marketRepositoryProvider));

    final pairSummary = await usecase.getPairSummary(exchangeName, pair, cancelToken: cancelToken);
    return FavoritePair(
      pair: Pair(pair: pair, exchange: exchangeName, pairName: PairHelper.convertPairName(pair)),
      pairSummary: pairSummary,
    );
  } on DataException catch (error) {
    if (error.message == LocaleKeys.errorRequestNotFound) {
      await ref.read(settingsProvider.notifier).verifyFavoritePair();
    }
    return Future.value(
      const FavoritePair(
        pair: Pair(exchange: '', pair: ''),
        pairSummary: PairSummary(price: Price(last: 0, high: 0, low: 0, change: Change(percentage: 0, absolute: 0)), volume: 0, volumeQuote: 0),
      ),
    );
  }
});
