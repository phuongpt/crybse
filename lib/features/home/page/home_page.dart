import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/favorite/presentation/pages/favorite_page.dart';
import 'package:crybse/features/market/presentation/page/market_page.dart';
import 'package:crybse/features/search/presentation/page/search_page.dart';
import 'package:crybse/features/settings/presentation/page/settings_page.dart';
import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/providers/navigation_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const routeName = '/homePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);

    return Scaffold(
      body: currentScreen(navigation.index),
      bottomNavigationBar: BottomNavigationBar(
        key: Keys.NAV_BAR,
        currentIndex: navigation.index,
        onTap: (index) {
          ref.read(navigationProvider.notifier).selectPage(index);
        },
        items: [
          BottomNavigationBarItem(
            label: LocaleKeys.homeTitle.tr(),
            icon: const Icon(
              Icons.home,
              key: Keys.NAV_HOME,
            ),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.favoriteTitle.tr(),
            icon: const Icon(
              Icons.collections_bookmark,
              key: Keys.NAV_FAVORITE,
            ),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.searchTitle.tr(),
            icon: const Icon(
              Icons.search,
              key: Keys.NAV_SEARCH,
            ),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.settingsTitle.tr(),
            icon: const Icon(
              Icons.settings,
              key: Keys.NAV_SETTINGS,
            ),
          ),
        ],
      ),
    );
  }

  Widget currentScreen(int index) {
    switch (index) {
      case 0:
        return const MarketPage();
      case 1:
        return const FavoritePage();
      case 2:
        return const SearchPage();
      case 3:
        return const SettingsPage();
      default:
        return Container();
    }
  }
}
