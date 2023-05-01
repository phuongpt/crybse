import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/features/market/presentation/widget/line_chart.dart';
import 'package:crybse/routers/app_route.gr.dart';
import 'package:crybse/shared/core/constants/keys.dart';
import 'package:crybse/shared/core/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/models/model.dart';
import 'package:crybse/shared/helper/price_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPair = Provider<Pair>((ref) => const Pair(exchange: '', pair: ''));

class PairTile extends HookConsumerWidget {
  const PairTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pair = ref.watch(currentPair);
    final summary = ref.watch(pairSummaryProvider(pair));
    final graph = ref.watch(graphDataProvider(pair));

    return Container(
      key: Keys.PAIR_TILE,
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(
            MarketDetailPageRoute(pair: pair),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 100,
          child: summary.when(
              data: (PairSummary summary) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: AutoSizeText(pair.pairName!,
                                textAlign: TextAlign.start,
                                minFontSize: 0,
                                stepGranularity: 0.1,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headlineMedium),
                          ),
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AutoSizeText(
                                  PriceHelper.formatPrice(summary.price.change.absolute, 7),
                                  minFontSize: 0,
                                  stepGranularity: 0.1,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.titleLarge!.apply(color: summary.price.change.absolute >= 0 ? Colors.green : Colors.red),
                                ),
                                AutoSizeText(
                                  ' (${PriceHelper.formatPrice(summary.price.change.percentage, 2)}%)',
                                  textAlign: TextAlign.end,
                                  minFontSize: 0,
                                  stepGranularity: 0.1,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.titleLarge!.apply(color: summary.price.change.absolute >= 0 ? Colors.green : Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: AutoSizeText(
                            PriceHelper.formatPrice(summary.price.last, 10),
                            minFontSize: 10,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            child: graph.when(
                                data: (data) => LineChartWidget(
                                      color: Theme.of(context).focusColor,
                                      data: utils.getPoints(data),
                                    ),
                                loading: () => const LineChartWidget(loading: true),
                                error: (e, ex) => const LineChartWidget(error: true)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stk) => Center(child: Text(error.toString().tr()))),
        ),
      ),
    );
  }
}
