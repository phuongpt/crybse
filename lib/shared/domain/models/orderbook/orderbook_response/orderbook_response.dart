import 'package:crybse/shared/domain/models/orderbook/orderbook/orderbook.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orderbook_response.freezed.dart';

@freezed
abstract class OrderBookResponse with _$OrderBookResponse {
  const factory OrderBookResponse(OrderBook result) = _OrderBookResponse;

  factory OrderBookResponse.fromJson(Map<String, dynamic> json) {
    final result = OrderBook.fromJson(json['result'] as Map<String, dynamic>);
    return OrderBookResponse(result);
  }
}
