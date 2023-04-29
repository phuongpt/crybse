// ignore_for_file: avoid_dynamic_calls

import 'package:crybse/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum DataExceptionMessageCode { UserNotFound }

class DataException implements Exception {
  DataException({required this.message});

  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = LocaleKeys.errorRequestCancelled;
        break;
      case DioErrorType.connectionTimeout:
        message = LocaleKeys.errorConnectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        message = LocaleKeys.errorReceiveTimeout;
        break;
      case DioErrorType.connectionError:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = LocaleKeys.errorSendTimeout;
        break;
      case DioErrorType.badCertificate:
        message = LocaleKeys.errorInternetConnection;
        break;
      case DioErrorType.badResponse:
        message = LocaleKeys.errorInternetConnection;
        break;
      case DioErrorType.unknown:
        message = LocaleKeys.errorInternetConnection;
        break;
    }
  }

  DataException.fromAuthError(AuthException error) {
    if (error.statusCode != null) {
      message = _handleError(int.parse(error.statusCode!));
    }
    message += ' (${error.message})';
  }

  DataException.fromApplicationError(dynamic exception) {
    if (exception.message != null && exception.message == DataExceptionMessageCode.UserNotFound) {
      message = LocaleKeys.errorUserNotFound;
    } else {
      message = LocaleKeys.errorSomethingWentWrong;
    }
  }

  String message = '';

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return LocaleKeys.errorBadRequest;
      case 404:
        return LocaleKeys.errorRequestNotFound;
      case 500:
        return LocaleKeys.errorIntenalServer;
      default:
        return LocaleKeys.errorSomethingWentWrong;
    }
  }

  @override
  String toString() => message;
}
