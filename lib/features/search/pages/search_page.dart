import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/market/presentation/widgets/pair_tile.dart';
import 'package:crybse/features/search/providers/search_provider.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  static const routeName = '/searchPage';

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      ref.read(searchTextProvider.notifier).state = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pairs = ref.watch(pairsSearchProvider);
    return Container(
      key: Keys.SEARCH_SCREEN,
      child: Column(
        children: [
          AppBar(
            toolbarHeight: 65,
            backgroundColor: Colors.black,
            title: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                key: Keys.SEARCH_TEXT_FIELD,
                controller: searchController,
                enableSuggestions: false,
                textCapitalization: TextCapitalization.characters,
                autovalidateMode: AutovalidateMode.disabled,
                style: const TextStyle(color: Colors.white, fontSize: 21),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear_sharp,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {
                      searchController.clear();
                      ref.read(searchTextProvider.notifier).state = '';
                    },
                  ),
                  hintText: LocaleKeys.searchBar.tr(),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: pairs.maybeWhen(
                    data: (data) {
                      return Stack(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.length,
                            itemBuilder: (ctx, int id) => ProviderScope(
                              overrides: [
                                currentPair.overrideWithValue(data[id]),
                              ],
                              child: const PairTile(),
                            ),
                          ),
                          if (data.isEmpty)
                            Center(
                                child: Text(
                              LocaleKeys.noResults.tr(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ))
                        ],
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
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
