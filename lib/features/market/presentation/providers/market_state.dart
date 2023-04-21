import 'package:crybse/shared/domain/models/market/market.dart';
import 'package:equatable/equatable.dart';

enum MarketStateStatus { initial, loading, success, failure }

class MarketState extends Equatable {
  const MarketState({
    this.data = const [],
    this.status = MarketStateStatus.initial,
    this.message = '',
  });

  final MarketStateStatus status;
  final List<Pair> data;
  final String message;

  MarketState copyWith({
    List<Pair>? data,
    MarketStateStatus? status,
    String? message,
  }) {
    print('copyWith ${status ?? this.status}');
    return MarketState(
      data: data ?? this.data,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'MarketState(status:$status, message:$message)';
  }

  @override
  List<Object?> get props => [status];
}
