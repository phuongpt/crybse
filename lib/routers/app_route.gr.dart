// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:crybse/features/auth/presentation/pages/sign_in_page.dart'
    as _i4;
import 'package:crybse/features/auth/presentation/pages/sign_up_page.dart'
    as _i5;
import 'package:crybse/features/favorite/presentation/pages/favorite_page.dart'
    as _i7;
import 'package:crybse/features/home/pages/home_page.dart' as _i2;
import 'package:crybse/features/market/presentation/pages/market_page.dart'
    as _i9;
import 'package:crybse/features/market_detail/presentation/pages/maket_detail_page.dart'
    as _i6;
import 'package:crybse/features/search/pages/search_page.dart' as _i8;
import 'package:crybse/features/settings/presentation/pages/settings_page.dart'
    as _i1;
import 'package:crybse/features/splash/presentation/pages/splash_page.dart'
    as _i3;
import 'package:crybse/shared/domain/models/market/market.dart' as _i12;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SettingsPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    SignInPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    MarketDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<MarketDetailPageRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MarketDetailPage(
          key: args.key,
          pair: args.pair,
        ),
      );
    },
    FavoritePageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FavoritePage(),
      );
    },
    SearchPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchPage(),
      );
    },
    MarketPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MarketPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsPageRoute extends _i10.PageRouteInfo<void> {
  const SettingsPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i10.PageRouteInfo<void> {
  const HomePageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashPageRoute extends _i10.PageRouteInfo<void> {
  const SplashPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInPage]
class SignInPageRoute extends _i10.PageRouteInfo<void> {
  const SignInPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignInPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpPageRoute extends _i10.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MarketDetailPage]
class MarketDetailPageRoute
    extends _i10.PageRouteInfo<MarketDetailPageRouteArgs> {
  MarketDetailPageRoute({
    _i11.Key? key,
    required _i12.Pair pair,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MarketDetailPageRoute.name,
          args: MarketDetailPageRouteArgs(
            key: key,
            pair: pair,
          ),
          initialChildren: children,
        );

  static const String name = 'MarketDetailPageRoute';

  static const _i10.PageInfo<MarketDetailPageRouteArgs> page =
      _i10.PageInfo<MarketDetailPageRouteArgs>(name);
}

class MarketDetailPageRouteArgs {
  const MarketDetailPageRouteArgs({
    this.key,
    required this.pair,
  });

  final _i11.Key? key;

  final _i12.Pair pair;

  @override
  String toString() {
    return 'MarketDetailPageRouteArgs{key: $key, pair: $pair}';
  }
}

/// generated route for
/// [_i7.FavoritePage]
class FavoritePageRoute extends _i10.PageRouteInfo<void> {
  const FavoritePageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FavoritePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritePageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchPage]
class SearchPageRoute extends _i10.PageRouteInfo<void> {
  const SearchPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MarketPage]
class MarketPageRoute extends _i10.PageRouteInfo<void> {
  const MarketPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MarketPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
