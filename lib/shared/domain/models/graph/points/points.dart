// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';

part 'points.freezed.dart';

@freezed
abstract class Points with _$Points {
  const factory Points(
      {required double closeTime,
      required double openTime,
      required double highPrice,
      required double lowPrice,
      required double closePrice,
      required double volume,
      required double quoteVolume}) = _Points;

  factory Points.fromJson(dynamic json) {
    return _Points(
      closeTime: double.parse(json[0].toString()),
      openTime: double.parse(json[1].toString()),
      highPrice: double.parse(json[2].toString()),
      lowPrice: double.parse(json[3].toString()),
      closePrice: double.parse(json[4].toString()),
      volume: double.parse(json[5].toString()),
      quoteVolume: double.parse(json[6].toString()),
    );
  }
}
