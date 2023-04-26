// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/market/presentation/providers/favorite_pair_provider.dart';
import 'package:crybse/features/market/presentation/providers/market_provider.dart';
import 'package:crybse/features/market/presentation/widgets/favorite_pair.dart';
import 'package:crybse/features/market/presentation/widgets/pair_tile.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MarketPage extends ConsumerStatefulWidget {
  const MarketPage({super.key});
  static const routeName = '/marketPage';

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends ConsumerState<MarketPage> {
  @override
  Widget build(BuildContext context) {
    final market = ref.watch(marketNotifierProvider);
    final favoritePair = ref.watch(favoritePairProvider);
    return Container(
      key: Keys.HOME_SCREEN,
      child: Column(
        children: [
          AppBar(
            toolbarHeight: 65,
            title: const Text(
              'CRYBSE',
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: favoritePair.when(
                    data: FavoritePairWidget.new,
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, e) => Center(child: Text(error.toString().tr())),
                  ),
                ),
                Expanded(
                  child: market.when(
                    data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (ctx, int idx) => ProviderScope(
                        overrides: [
                          currentPair.overrideWithValue(data[idx]),
                        ],
                        child: const PairTile(),
                      ),
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error) => Center(child: Text(error.toString().tr())),
                    initial: () => const Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
