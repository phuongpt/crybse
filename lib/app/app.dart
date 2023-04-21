import 'package:crybse/features/settings/presentation/providers/settings_provider.dart';
import 'package:crybse/routers/app_route.dart';
import 'package:crybse/shared/constants/app_theme.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  App({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final themeMode = settings.maybeWhen(data: (data) => utils.getThemeMode(data.themeMode), orElse: () => ThemeMode.system);
    return MaterialApp.router(
      title: 'Crybse',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
