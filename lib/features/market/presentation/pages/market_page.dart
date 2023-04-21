// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/market/presentation/providers/market_provider.dart';
import 'package:crybse/features/market/presentation/providers/market_state.dart';
import 'package:crybse/features/market/presentation/widgets/favorite_pair.dart';
import 'package:crybse/features/market/presentation/widgets/pair_tile.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/presentation/widgets/list/list.dart';
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
    final state = ref.watch(marketNotifierProvider);
    // final favoritePair = ref.watch(favoritePairProvider);
    return Container(
      key: Keys.HOME_SCREEN,
      child: Column(
        children: [
          AppBar(
            toolbarHeight: 65,
            centerTitle: false,
            title: Text(
              LocaleKeys.homeTitle.tr(),
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                width: 45,
                child: const Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  // child: favoritePair.when(
                  //   data: (data) {
                  //     return FavoritePairWidget(data);
                  //   },
                  //   loading: () => const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  //   error: (error, e) => Center(
                  //     child: Text(error.toString().tr()),
                  //   ),
                  // ),
                ),
                // Expanded(
                //   child: pairs.when(
                //     data: (data) {
                //       return ListView.builder(
                //         itemCount: data.length,
                //         itemBuilder: (ctx, int idx) => ProviderScope(
                //           overrides: [
                //             currentPair.overrideWithValue(data[idx]),
                //           ],
                //           child: const PairTile(),
                //         ),
                //       );
                //     },
                //     loading: () => const Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //     error: (error, e) => Center(
                //       child: Text(error.toString().tr()),
                //     ),
                //   ),
                // )

                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (ctx, int idx) => ProviderScope(
                      overrides: [
                        currentPair.overrideWithValue(state.data[idx]),
                      ],
                      child: const PairTile(),
                    ),
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
