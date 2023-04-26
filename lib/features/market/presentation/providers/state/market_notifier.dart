import 'package:crybse/features/market/domain/usecases/market_usecase.dart';
import 'package:crybse/features/market/presentation/providers/state/market_state.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketNotifier extends StateNotifier<MarketState> {
  MarketNotifier({required this.usecase}) : super(const MarketState.initial());

  final MarketUsecase usecase;

  Future<void> getPairs(String market) async {
    try {
      final results = await usecase.getPairs(market);
      state = MarketState.data(data: results);
    } on DataException catch (_) {
      state = MarketState.error(error: _.message);
    } catch (_) {
      state = MarketState.error(error: DataException.fromApplicationError(_).message);
    }
  }
}
