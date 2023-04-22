import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/home/pages/home_page.dart';
import 'package:crybse/features/market/presentation/pages/market_page.dart';
import 'package:crybse/features/search/pages/search_page.dart';
import 'package:crybse/features/settings/presentation/pages/settings_page.dart';
import 'package:crybse/routers/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashPageRoute.page, initial: true),
        AutoRoute(page: HomePageRoute.page, path: HomePage.routeName),
        AutoRoute(page: MarketPageRoute.page, path: MarketPage.routeName),
        AutoRoute(page: SearchPageRoute.page, path: SearchPage.routeName),
        AutoRoute(page: SettingsPageRoute.page, path: SettingsPage.routeName),
      ];
}
