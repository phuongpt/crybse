// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      exchange: json['exchange'] as String,
      pair: json['pair'] as String,
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'exchange': instance.exchange,
      'pair': instance.pair,
    };
