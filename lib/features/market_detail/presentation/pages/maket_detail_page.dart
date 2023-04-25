import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/market/presentation/providers/market_provider.dart';
import 'package:crybse/features/market/presentation/widgets/line_chart.dart';
import 'package:crybse/features/market/presentation/widgets/title_price.dart';
import 'package:crybse/features/market_detail/presentation/widgets/market_detail_widget.dart';
import 'package:crybse/features/market_detail/presentation/widgets/time_bar_selector.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/models/market/market.dart';
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
        title: TitlePrice(pair: pair),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
