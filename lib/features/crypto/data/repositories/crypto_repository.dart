// ignore_for_file: inference_failure_on_function_invocation

import 'package:crybse/features/crypto/domain/repositories/crypto_repository_interface.dart';
import 'package:crybse/shared/constants/exceptions.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoRepository implements CryptoRepositoryInterface {
  CryptoRepository({Provider<Dio>? clientProvider})
      : _clientProvider = clientProvider ??
            Provider(
              (ref) => Dio(
                BaseOptions(
                  headers: {
                    'X-CW-API-Key': dotenv.env['API_KEY'],
                  },
                  baseUrl: 'https://api.cryptowat.ch',
                ),
              ),
            );

  final Provider<Dio> _clientProvider;
  final _container = ProviderContainer();

  @override
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken}) async {
    try {
      final response = await _container.read(_clientProvider).get('/markets/$market', cancelToken: cancelToken);
      return MarketResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _container.read(_clientProvider).get('/markets/$market/$pair/summary', cancelToken: cancelToken);
      return PairResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _container.read(_clientProvider).get('/markets/$market/$pair/orderbook', cancelToken: cancelToken);
      return OrderBookResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _container.read(_clientProvider).get('/markets/$market/$pair/trades', cancelToken: cancelToken);
      return TradesResponse.fromJson(response.data as Map<String, dynamic>).result!;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<Graph> getPairGraph(String market, String pair, {String periods = '', String after = '', String before = '', CancelToken? cancelToken}) async {
    try {
      final response = await _container
          .read(_clientProvider)
          .get('/markets/$market/$pair/ohlc', queryParameters: {'periods': periods, 'after': after, 'before': before}, cancelToken: cancelToken);
      return GraphResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken}) async {
    try {
      final response = await _container.read(_clientProvider).get('/exchanges', cancelToken: cancelToken);
      return ExchangesResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }
}
