import 'package:crybse/features/market/domain/provider/market_provider.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:crybse/shared/constants/utils.dart' as utils;
import 'package:crybse/shared/domain/models/model.dart';
import 'package:crybse/shared/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(SettingsNotifier.new);

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(this.ref) : super(const SettingsState.initial()) {
    loadData();
  }
  final Ref ref;
  late SettingsDetails details;

  Future<void> loadData() async {
    state = const SettingsState.loading();
    final language = (await ref.read(storageProvider).read(key: 'language')) ?? utils.defaultLenguage;
    final exchange = (await ref.read(storageProvider).read(key: 'exchange')) ?? utils.defaultExchange;
    final pair = (await ref.read(storageProvider).read(key: 'pair')) ?? utils.defaultPair;
    final theme = (await ref.read(storageProvider).read(key: 'theme')) ?? utils.defaultTheme;
    details = SettingsDetails(currentLanguage: language, favoriteExchange: exchange, favoritePair: pair, themeMode: theme);
    state = SettingsState.data(details: details);
  }

  Future<void> setLanguage(String language) async {
    state = const SettingsState.loading();
    await ref.read(storageProvider).write(key: 'language', value: language);
    details = details.copyWith(currentLanguage: language);
    state = SettingsState.data(details: details);
  }

  Future<void> setFavoriteExchange(String exchange) async {
    state = const SettingsState.loading();
    await ref.read(storageProvider).write(key: 'exchange', value: exchange);
    details = details.copyWith(favoriteExchange: exchange);
    state = SettingsState.data(details: details);
    await verifyFavoritePair();
  }

  Future<void> verifyFavoritePair() async {
    try {
      await ref.read(marketRepositoryProvider).getPairSummary(details.favoriteExchange, details.favoritePair);
    } on DataException catch (error) {
      if (error.message == LocaleKeys.errorRequestNotFound) {
        final pairs = await ref.read(marketRepositoryProvider).getPairs(details.favoriteExchange);
        await setFavoritePair(pairs.first.pair);
      }
    }
  }

  Future<void> setFavoritePair(String pair) async {
    state = const SettingsState.loading();
    await ref.read(storageProvider).write(key: 'pair', value: pair);
    details = details.copyWith(favoritePair: pair);
    state = SettingsState.data(details: details);
  }

  Future<void> setTheme(String theme) async {
    state = const SettingsState.loading();
    await ref.read(storageProvider).write(key: 'theme', value: theme);
    details = details.copyWith(themeMode: theme);
    state = SettingsState.data(details: details);
  }
}
