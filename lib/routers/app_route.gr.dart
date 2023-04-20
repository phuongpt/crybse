// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:crybse/features/crypto/presentation/pages/market_page.dart'
    as _i3;
import 'package:crybse/features/home/pages/home_page.dart' as _i2;
import 'package:crybse/features/search/pages/search_page.dart' as _i5;
import 'package:crybse/features/settings/presentation/pages/settings_page.dart'
    as _i1;
import 'package:crybse/features/splash/presentation/pages/splash_page.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SettingsPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MarketPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MarketPage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    SearchPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsPageRoute extends _i6.PageRouteInfo<void> {
  const SettingsPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MarketPage]
class MarketPageRoute extends _i6.PageRouteInfo<void> {
  const MarketPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MarketPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashPageRoute extends _i6.PageRouteInfo<void> {
  const SplashPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SearchPage]
class SearchPageRoute extends _i6.PageRouteInfo<void> {
  const SearchPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
