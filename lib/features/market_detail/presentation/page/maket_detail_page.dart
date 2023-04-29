import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/favorite/presentation/providers/favorite_provider.dart';
import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/features/market/presentation/widget/line_chart.dart';
import 'package:crybse/features/market_detail/presentation/widget/market_detail_widget.dart';
import 'package:crybse/features/market_detail/presentation/widget/time_bar_selector.dart';
import 'package:crybse/features/market_detail/presentation/widget/title_price_detail.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/models/market/market.dart';
import 'package:crybse/shared/extensions/list_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MarketDetailPage extends HookConsumerWidget {
  const MarketDetailPage({super.key, required this.pair});
  final Pair pair;
  static const routeName = '/marketDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graph = ref.watch(graphDataProvider(pair));

    return Scaffold(
      key: Keys.DETAILS_SCREEN,
      appBar: AppBar(
        title: Text(pair.pairName!),
        actions: [FavoriteButton(pair: pair)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TitlePriceDetail(pair: pair),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: graph.when(
                data: (data) => LineChartWidget(
                  data: utils.getPoints(data),
                  color: Theme.of(context).focusColor,
                ),
                loading: () => const LineChartWidget(loading: true),
                error: (e, ex) => const LineChartWidget(error: true),
              ),
            ),
            const SizedBox(height: 20),
            const TimeBarSelector(),
            const SizedBox(height: 15),
            MarketDetailWidget(pair: pair),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends HookConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.pair,
  });

  final Pair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.read(favoriteNotifierProvider.notifier);
    final favorited = ref.watch(favoriteNotifierProvider).maybeWhen(
          orElse: () => null,
          data: (data) => data.firstWhereOrNull((element) => element.pair == pair.pair),
        );

    return IconButton(
      onPressed: () => {
        if (favorited != null) favorite.deleteFavorite(favorited.id!) else favorite.addFavorite(pair),
      },
      icon: favorited != null ? const Icon(Icons.bookmark_added) : const Icon(Icons.bookmark_add_outlined),
    );
  }
}
