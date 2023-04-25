import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/models/model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TradesSection extends StatelessWidget {
  const TradesSection({super.key, required this.data});
  final List<Trade> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.time.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.price.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.amount.tr(),
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          utils.epochToString(data[index].timestamp),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data[index].price,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          data[index].amount,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
