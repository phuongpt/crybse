// import 'package:auto_route/auto_route.dart';
// import 'package:crybse/features/market/presentation/widgets/pair_tile.dart';
// import 'package:crybse/features/search/providers/search_provider.dart';
// import 'package:crybse/generated/locale_keys.g.dart';
// import 'package:crybse/shared/constants/keys.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// @RoutePage()
// class SearchPage extends HookConsumerWidget {
//   const SearchPage({super.key});
//   static const routeName = '/searchPage';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final pairs = ref.watch(pairsSearchProvider);
//     return Container(
//       key: Keys.SEARCH_SCREEN,
//       child: Column(
//         children: [
//           AppBar(
//             toolbarHeight: 65,
//             title: Container(
//               height: 50,
//               padding: const EdgeInsets.only(left: 15),
//               child: TextFormField(
//                 key: Keys.SEARCH_TEXT_FIELD,
//                 initialValue: ref.read(searchTextProvider),
//                 enableSuggestions: false,
//                 textCapitalization: TextCapitalization.characters,
//                 autovalidateMode: AutovalidateMode.disabled,
//                 style: const TextStyle(color: Colors.white, fontSize: 21),
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                   hintText: LocaleKeys.searchBar.tr(),
//                   hintStyle: const TextStyle(color: Colors.white),
//                 ),
//                 onChanged: (value) => {
//                   ref.read(searchTextProvider.notifier).state = value,
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: pairs.maybeWhen(
//                     data: (data) {
//                       return Stack(
//                         children: [
//                           ListView.builder(
//                             padding: EdgeInsets.zero,
//                             itemCount: data.length,
//                             itemBuilder: (ctx, int id) => ProviderScope(
//                               overrides: [
//                                 currentPair.overrideWithValue(data[id]),
//                               ],
//                               child: const PairTile(),
//                             ),
//                           ),
//                           if (data.isEmpty) Center(child: Text(LocaleKeys.noResults.tr()))
//                         ],
//                       );
//                     },
//                     orElse: () => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
