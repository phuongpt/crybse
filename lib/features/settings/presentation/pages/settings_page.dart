import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/market/presentation/providers/market_provider.dart';
import 'package:crybse/features/market/presentation/providers/market_state.dart';
import 'package:crybse/features/settings/presentation/providers/settings_provider.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/helpers/helper.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  static const routeName = '/settingsPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final exchanges = ref.watch(exchangesProvider);
    final market = ref.watch(marketNotifierProvider);

    final details = settings.maybeWhen(data: (details) => details, orElse: () => null);

    return details != null
        ? Container(
            key: Keys.SETTINGS_SCREEN,
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 65,
                  centerTitle: true,
                  title: Text(
                    LocaleKeys.settingsTitle.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Expanded(
                  child: SettingsList(
                    contentPadding: EdgeInsets.zero,
                    sections: [
                      SettingsSection(
                        title: Text(LocaleKeys.languageSection.tr()),
                        tiles: [
                          SettingsTile(
                            title: Text(LocaleKeys.language.tr()),
                            value: Text(details.currentLanguage.tr()),
                            leading: const Icon(Icons.language),
                            onPressed: (BuildContext ctx) => showLenguageSelectionDialog(context, ref, details.currentLanguage),
                          ),
                        ],
                      ),
                      SettingsSection(
                        title: Text(LocaleKeys.dataSection.tr()),
                        tiles: [
                          SettingsTile(
                            title: Text(LocaleKeys.exchange.tr()),
                            value: Text(details.favoriteExchange.toUpperCase()),
                            leading: const Icon(Icons.graphic_eq),
                            onPressed: (BuildContext context) => showExchangeSelectDialog(context, ref, exchanges),
                          ),
                          SettingsTile(
                            title: Text(LocaleKeys.topPair.tr()),
                            value: Text(Helper.convertPairName(details.favoritePair)),
                            leading: const Icon(Icons.language),
                            onPressed: (BuildContext context) => showTopPairSelectDialog(context, ref, market),
                          ),
                        ],
                      ),
                      SettingsSection(
                        title: Text(LocaleKeys.designSection.tr()),
                        tiles: [
                          SettingsTile(
                            title: Text(LocaleKeys.appTheme.tr()),
                            value: Text(details.themeMode),
                            leading: const Icon(Icons.graphic_eq),
                            onPressed: (BuildContext context) => showThemeSelectDialog(context, ref, details.themeMode),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const CircularProgressIndicator();
  }

  void showLenguageSelectionDialog(BuildContext context, WidgetRef ref, String currentLenguage) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(LocaleKeys.language.tr()),
        content: Container(
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: currentLenguage,
                    groupValue: LocaleKeys.english,
                    onChanged: (value) async {
                      await context.setLocale(const Locale('en'));

                      await ref.read(settingsProvider.notifier).setLanguage(LocaleKeys.english);

                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    LocaleKeys.english.tr(),
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: currentLenguage,
                    groupValue: LocaleKeys.spanish,
                    onChanged: (value) async {
                      await context.setLocale(const Locale('es'));
                      await ref.read(settingsProvider.notifier).setLanguage(LocaleKeys.spanish);
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    LocaleKeys.spanish.tr(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showExchangeSelectDialog(BuildContext context, WidgetRef ref, AsyncValue<List<Exchange>> exchanges) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 400,
              width: 200,
              child: exchanges.maybeWhen(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(settingsProvider.notifier).setFavoriteExchange(data[index].symbol);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          data[index].name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
                orElse: () => const CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  void showTopPairSelectDialog(BuildContext context, WidgetRef ref, MarketState market) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
                height: 300,
                width: 200,
                child: market.maybeWhen(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ref.read(settingsProvider.notifier).setFavoritePair(data[index].pair);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(data[index].pairName!, style: const TextStyle(fontSize: 18)),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    orElse: () => const Center(
                          child: CircularProgressIndicator(),
                        ))),
          );
        });
  }

  void showThemeSelectDialog(BuildContext context, WidgetRef ref, String currentTheme) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                children: utils.themeModes
                    .map((data) => GestureDetector(
                          onTap: () {
                            ref.read(settingsProvider.notifier).setTheme(data);
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                onChanged: (value) {
                                  ref.read(settingsProvider.notifier).setTheme(value!);
                                  Navigator.pop(context);
                                },
                                value: data,
                                groupValue: currentTheme,
                              ),
                              Text(data, style: const TextStyle(fontSize: 18))
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}
