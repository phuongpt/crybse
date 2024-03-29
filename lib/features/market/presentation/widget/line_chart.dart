// ignore_for_file: noop_primitive_operations

import 'dart:math';

import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/shared/core/constants/utils.dart' as utils;
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key, this.data = const [], this.color = const Color(0xff02d39a), this.loading = false, this.error = false});
  final List<double> data;
  final Color color;
  final bool loading;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Opacity(
        opacity: data.isNotEmpty && !loading & !error ? 1 : 0.3,
        child: SizedBox(
          width: double.infinity,
          child: LineChart(
            mainData(data.isNotEmpty && !loading & !error ? data : utils.demoGraphData),
            swapAnimationDuration: const Duration(seconds: 0),
          ),
        ),
      ),
      if (loading)
        const Center(
          child: CircularProgressIndicator(),
        )
      else if (error || data.isEmpty)
        Center(
          child: Text(LocaleKeys.noResults.tr(), style: Theme.of(context).textTheme.displaySmall),
        )
    ]);
  }

  LineChartData mainData(List<double> data) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 4,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: data.length.toDouble() - 1,
      minY: data.reduce(min).toDouble(),
      maxY: data.reduce(max).toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: listData(data),
          color: color,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      ],
    );
  }

  List<FlSpot> listData(List<double> data) {
    return data.mapIndexed((e, i) => FlSpot(i.toDouble(), e.toDouble())).toList();
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
