import 'package:crybse/features/market/domain/usecases/market_usecase.dart';
import 'package:crybse/features/market/presentation/providers/market_state.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketNotifier extends StateNotifier<MarketState> {
  MarketNotifier({required this.usecase}) : super(const MarketState());

  final MarketUsecase usecase;

  Future<void> getPairs() async {
    try {
      final results = await usecase.getPairs('binance');
      state = state.copyWith(data: results, status: MarketStateStatus.success);
    } on DataException catch (_) {
      state = state.copyWith(status: MarketStateStatus.failure, message: _.message);
    } catch (_) {
      state = state.copyWith(status: MarketStateStatus.failure, message: DataException.fromApplicationError(_).message);
    }
  }
}
