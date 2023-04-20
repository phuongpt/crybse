import 'package:freezed_annotation/freezed_annotation.dart';
part 'orderprice.freezed.dart';

@freezed
abstract class OrderPrice with _$OrderPrice {
  const factory OrderPrice({required double price, required double amount}) = _OrderPrice;
}
