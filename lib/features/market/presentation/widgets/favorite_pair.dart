// ignore_for_file: depend_on_referenced_packages

import 'package:crybse/features/market/presentation/widgets/title_price.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FavoritePairWidget extends HookWidget {
  const FavoritePairWidget(this.data, {super.key});
  final FavoritePair data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TitlePrice(pair: data.pair),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: Theme.of(context).dividerColor,
            height: 1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
