import 'package:crybse/shared/domain/models/graph/points/points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pair_graph.freezed.dart';

@freezed
abstract class PairGraph with _$PairGraph {
  const factory PairGraph({required String period, required List<Points> points}) = _PairGraph;

  factory PairGraph.fromJson(dynamic json, String period) {
    final points = <Points>[];
    json.forEach((v) {
      points.add(Points.fromJson(v));
    });
    return PairGraph(period: period, points: points);
  }
}
