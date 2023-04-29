import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/auth/presentation/page/sign_in_page.dart';
import 'package:crybse/features/auth/presentation/page/sign_up_page.dart';
import 'package:crybse/features/home/page/home_page.dart';
import 'package:crybse/features/market/presentation/page/market_page.dart';
import 'package:crybse/features/market_detail/presentation/page/maket_detail_page.dart';
import 'package:crybse/features/search/presentation/page/search_page.dart';
import 'package:crybse/features/settings/presentation/page/settings_page.dart';
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
        AutoRoute(page: MarketDetailPageRoute.page, path: MarketDetailPage.routeName),
        AutoRoute(page: SignInPageRoute.page, path: SignInPage.routeName),
        AutoRoute(page: SignUpPageRoute.page, path: SignUpPage.routeName),
      ];
}
