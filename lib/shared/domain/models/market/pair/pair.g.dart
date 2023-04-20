// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pair _$PairFromJson(Map<String, dynamic> json) => Pair(
      id: json['id'] as int?,
      exchange: json['exchange'] as String,
      pair: json['pair'] as String,
      pairName: json['pairName'] as String?,
      active: json['active'] as bool?,
      route: json['route'] as String?,
    );

Map<String, dynamic> _$PairToJson(Pair instance) => <String, dynamic>{
      'id': instance.id,
      'exchange': instance.exchange,
      'pair': instance.pair,
      'pairName': instance.pairName,
      'active': instance.active,
      'route': instance.route,
    };
