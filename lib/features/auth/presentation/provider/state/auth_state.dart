import 'package:crybse/features/auth/domain/models/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.data({required UserEntity data}) = _AuthStateData;
  const factory AuthState.error({String? error}) = _AuthStateError;
}
