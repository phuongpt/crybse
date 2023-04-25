import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/domain/models/pair/pair.dart';
import 'package:crybse/shared/helper/price_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key, required this.data});
  final PairSummary data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.price.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.last.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.price.last, 10),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.high.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.price.high, 10),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.low.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.price.low, 10),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.change.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.price.change.absolute, 10),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                LocaleKeys.volume.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.volume.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.volume, 2),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.quoteVolume.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                PriceHelper.formatPrice(data.volumeQuote, 2),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}
