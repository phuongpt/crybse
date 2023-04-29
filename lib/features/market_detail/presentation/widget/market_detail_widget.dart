// ignore_for_file: depend_on_referenced_packages

import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/features/market_detail/presentation/provider/market_detail_provider.dart';
import 'package:crybse/features/market_detail/presentation/widget/ohlc_section.dart';
import 'package:crybse/features/market_detail/presentation/widget/order_book_section.dart';
import 'package:crybse/features/market_detail/presentation/widget/summary_section.dart';
import 'package:crybse/features/market_detail/presentation/widget/trades_section.dart';
import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/shared/domain/models/market/market.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketDetailWidget extends HookConsumerWidget {
  const MarketDetailWidget({super.key, required this.pair});
  final Pair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 4);
    final graph = ref.watch(graphDataProvider(pair));
    final summary = ref.watch(pairSummaryProvider(pair));
    final orderBook = ref.watch(pairOrderBookProvider(pair));
    final trades = ref.watch(tradesProvider(pair));

    return Column(
      children: [
        TabBar(
          labelColor: Theme.of(context).focusColor,
          unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
          unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium,
          labelStyle: Theme.of(context).textTheme.headlineMedium,
          indicatorWeight: 4,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Theme.of(context).focusColor,
          isScrollable: true,
          controller: controller,
          tabs: [
            SizedBox(
              width: 100,
              child: Tab(text: LocaleKeys.summary.tr()),
            ),
            Tab(
              text: LocaleKeys.orderbook.tr(),
            ),
            Tab(
              text: LocaleKeys.trades.tr(),
            ),
            Tab(
              text: LocaleKeys.ohlc.tr(),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: controller,
            children: [
              summary.when(
                data: (data) => SummarySection(data: data),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, e) => Center(
                  child: Text(error.toString().tr()),
                ),
              ),
              orderBook.when(
                data: (data) => OrderBookSection(data: data),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, e) => Center(
                  child: Text(error.toString().tr()),
                ),
              ),
              trades.when(
                data: (data) => TradesSection(data: data),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, e) => Center(
                  child: Text(error.toString().tr()),
                ),
              ),
              graph.when(
                data: (data) => OHLCSection(
                  data: data,
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, e) => Center(
                  child: Text(error.toString().tr()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
