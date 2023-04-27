import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed

/// Auth user entity
class UserEntity with _$UserEntity {
  /// Factory Constructor
  const factory UserEntity({
    required String id,
    required String email,
    required String phone,
    String? role,
  }) = _UserEntity;

  /// factory method to create entity from JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
