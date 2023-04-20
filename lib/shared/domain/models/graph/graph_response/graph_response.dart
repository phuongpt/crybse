import 'package:crybse/shared/domain/models/graph/graph/graph.dart';
import 'package:crybse/shared/domain/models/pair/allowance/allowance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_response.freezed.dart';

@freezed
abstract class GraphResponse with _$GraphResponse {
  const factory GraphResponse({required Graph result, required Allowance allowance}) = _GraphResponse;

  factory GraphResponse.fromJson(Map<String, dynamic> json) {
    final result = Graph.fromJson(json['result']);
    final allowance = Allowance.fromJson(json['allowance'] as Map<String, dynamic>);
    return GraphResponse(result: result, allowance: allowance);
  }
}
