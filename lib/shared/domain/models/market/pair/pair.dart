import 'package:crybse/shared/domain/helpers/helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pair.g.dart';
part 'pair.freezed.dart';

@JsonSerializable()
@freezed
abstract class Pair with _$Pair {
  const factory Pair({
    int? id,
    required String exchange,
    required String pair,
    String? pairName,
    bool? active,
    String? route,
  }) = _Pair;

  factory Pair.fromJson(Map<String, dynamic> json) {
    return _$PairFromJson(json).copyWith(
      pairName: Helper.convertPairName(json['pair'] as String),
    );
  }
}
