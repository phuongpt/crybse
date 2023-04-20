// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orderprice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderPrice {
  double get price => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderPriceCopyWith<OrderPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPriceCopyWith<$Res> {
  factory $OrderPriceCopyWith(
          OrderPrice value, $Res Function(OrderPrice) then) =
      _$OrderPriceCopyWithImpl<$Res, OrderPrice>;
  @useResult
  $Res call({double price, double amount});
}

/// @nodoc
class _$OrderPriceCopyWithImpl<$Res, $Val extends OrderPrice>
    implements $OrderPriceCopyWith<$Res> {
  _$OrderPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderPriceCopyWith<$Res>
    implements $OrderPriceCopyWith<$Res> {
  factory _$$_OrderPriceCopyWith(
          _$_OrderPrice value, $Res Function(_$_OrderPrice) then) =
      __$$_OrderPriceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, double amount});
}

/// @nodoc
class __$$_OrderPriceCopyWithImpl<$Res>
    extends _$OrderPriceCopyWithImpl<$Res, _$_OrderPrice>
    implements _$$_OrderPriceCopyWith<$Res> {
  __$$_OrderPriceCopyWithImpl(
      _$_OrderPrice _value, $Res Function(_$_OrderPrice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? amount = null,
  }) {
    return _then(_$_OrderPrice(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_OrderPrice implements _OrderPrice {
  const _$_OrderPrice({required this.price, required this.amount});

  @override
  final double price;
  @override
  final double amount;

  @override
  String toString() {
    return 'OrderPrice(price: $price, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPrice &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderPriceCopyWith<_$_OrderPrice> get copyWith =>
      __$$_OrderPriceCopyWithImpl<_$_OrderPrice>(this, _$identity);
}

abstract class _OrderPrice implements OrderPrice {
  const factory _OrderPrice(
      {required final double price,
      required final double amount}) = _$_OrderPrice;

  @override
  double get price;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPriceCopyWith<_$_OrderPrice> get copyWith =>
      throw _privateConstructorUsedError;
}
