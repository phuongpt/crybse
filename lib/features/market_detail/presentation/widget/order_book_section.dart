import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/shared/core/helpers/price_helper.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderBookSection extends StatelessWidget {
  const OrderBookSection({super.key, required this.data});
  final OrderBook data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                LocaleKeys.bid.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                LocaleKeys.ask.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: data.bids.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.bids[index].amount.toString(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              PriceHelper.formatPrice(data.bids[index].price, 10),
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: data.asks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.asks[index].amount.toString(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              PriceHelper.formatPrice(data.asks[index].price, 10),
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
