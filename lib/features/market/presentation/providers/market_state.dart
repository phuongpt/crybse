import 'package:crybse/shared/domain/models/market/market.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_state.freezed.dart';

@freezed
abstract class MarketState with _$MarketState {
  const factory MarketState.initial() = _MarketStateInitial;
  const factory MarketState.loading() = _MarketStateLoading;
  const factory MarketState.data({required List<Pair> data}) = _MarketStateData;
  const factory MarketState.error({String? error}) = _MarketStateError;
}
