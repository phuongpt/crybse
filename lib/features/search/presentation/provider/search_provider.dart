import 'package:crybse/features/market/presentation/provider/market_provider.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchTextProvider = StateProvider<String>((ref) => '');

final pairsSearchProvider = FutureProvider<List<Pair>>((ref) async {
  final market = ref.watch(marketNotifierProvider);
  final search = ref.watch(searchTextProvider);

  var list = <Pair>[];
  market.maybeWhen(
    data: (data) {
      if (search.isNotEmpty) {
        list = data.where((element) => element.pair.contains(search.replaceAll('/', '').toLowerCase())).toList();
      } else {
        list = [];
      }
    },
    orElse: () => {},
  );
  return list;
});
