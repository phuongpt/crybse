import 'package:crybse/features/crypto/domain/providers/crypto_provider.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchTextProvider = StateProvider<String>((ref) => '');

final pairsSearchProvider = FutureProvider<List<Pair>>((ref) async {
  final pairs = ref.watch(pairsProvider);
  final search = ref.watch(searchTextProvider);

  var list = <Pair>[];
  pairs.maybeWhen(
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
