// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/auth/presentation/provider/auth_provider.dart';
import 'package:crybse/features/favorite/presentation/providers/favorite_provider.dart';
import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/features/market/presentation/widget/pair_tile.dart';
import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/routers/app_route.gr.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/domain/models/market/pair/pair.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});
  static const routeName = '/favoritePage';

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favorite = ref.watch(favoriteNotifierProvider);
    final pairs = ref.read(marketNotifierProvider);

    ref.listen(
      authNotifierProvider.select((value) => value.whenOrNull(data: (data) => data)),
      (previous, next) {
        if (previous != next) {
          ref.read(favoriteNotifierProvider.notifier).refresh();
        }
      },
    );

    return Container(
      key: Keys.NAV_FAVORITE,
      child: Column(
        children: [
          AppBar(
            title: Text(LocaleKeys.favoriteTitle.tr()),
            actions: [
              IconButton(
                onPressed: () => {AutoRouter.of(context).push(const SignInPageRoute())},
                icon: const Icon(Icons.person_outline),
              )
            ],
          ),
          Expanded(
            child: favorite.when(
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, int idx) => ProviderScope(
                  overrides: [
                    currentPair.overrideWithValue(
                      pairs.maybeWhen(
                        orElse: () => const Pair(exchange: '', pair: ''),
                        data: (pairsData) => pairsData.firstWhere((element) => element.pair == data[idx].pair),
                      ),
                    ),
                  ],
                  child: const PairTile(),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text(error.toString().tr())),
              initial: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
