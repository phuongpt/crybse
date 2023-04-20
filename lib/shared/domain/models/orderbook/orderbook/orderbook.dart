import 'package:crybse/shared/domain/models/orderbook/orderprice/orderprice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orderbook.freezed.dart';

@freezed
abstract class OrderBook with _$OrderBook {
  const factory OrderBook(
    List<OrderPrice> asks,
    List<OrderPrice> bids,
    int seqNum,
  ) = _OrderBook;

  factory OrderBook.fromJson(Map<String, dynamic> json) {
    final asks = <OrderPrice>[];
    json['asks'].forEach((v) {
      asks.add(OrderPrice(price: double.parse(v[0].toString()), amount: double.parse(v[1].toString())));
    });

    final bids = <OrderPrice>[];
    json['bids'].forEach((v) {
      bids.add(
        OrderPrice(
          price: double.parse(v[0].toString()),
          amount: double.parse(
            v[1].toString(),
          ),
        ),
      );
    });
    final seqNum = json['seqNum'] as int;
    return OrderBook(asks, bids, seqNum);
  }
}
