import 'package:candlesticks/candlesticks.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:flutter/material.dart';

class OHLCSection extends StatelessWidget {
  const OHLCSection({super.key, required this.data});
  final Graph data;
  @override
  Widget build(BuildContext context) {
    final candles = data.pairs[0].points
        .map((e) => Candle(
              date: e.closeTime,
              high: e.highPrice,
              low: e.lowPrice,
              open: e.openPrice,
              close: e.closePrice,
              volume: e.volume,
            ))
        .toList();

    return Candlesticks(
      candles: candles,
    );
  }
}
