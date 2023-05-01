import 'package:auto_size_text/auto_size_text.dart';
import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/shared/core/helpers/price_helper.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitlePriceDetail extends HookConsumerWidget {
  const TitlePriceDetail({super.key, required this.pair});
  final Pair pair;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pairSummaryProvider(pair));

    return data.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: AutoSizeText(
                    PriceHelper.formatPrice(data.price.last, 5),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        PriceHelper.formatPrice(data.price.change.absolute, 5),
                        textAlign: TextAlign.start,
                        minFontSize: 0,
                        stepGranularity: 0.1,
                        maxLines: 1,
                        style: TextStyle(
                          color: data.price.change.absolute >= 0 ? Colors.green : Colors.red,
                          fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      AutoSizeText(
                        ' (${PriceHelper.formatPrice(data.price.change.percentage, 2)}%)',
                        textAlign: TextAlign.start,
                        minFontSize: 0,
                        stepGranularity: 0.1,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: data.price.change.absolute >= 0 ? Colors.green : Colors.red),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, e) => Center(
        child: Text(error.toString().tr()),
      ),
    );
  }
}
