// ignore_for_file: inference_failure_on_function_invocation, one_member_abstracts

import 'package:crybse/features/market/data/models/market_response/market_response.dart';
import 'package:crybse/shared/core/constants/exceptions.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class MarketRemoteDatasourceInterface {
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken});
  Future<List<Pair>> getCharacters(String market, {CancelToken? cancelToken});
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken});
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken});
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken});
  Future<Graph> getPairGraph(String market, String pair, {String periods = '', String after = '', String before = '', CancelToken? cancelToken});
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken});
}

class MarketRemoteDatasource implements MarketRemoteDatasourceInterface {
  MarketRemoteDatasource({Dio? client})
      : _client = client ??
            Dio(
              BaseOptions(
                headers: {'X-CW-API-Key': dotenv.env['API_KEY']},
                baseUrl: 'https://api.cryptowat.ch',
              ),
            );

  final Dio _client;

  @override
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/markets/$market', cancelToken: cancelToken);
      return MarketResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<List<Pair>> getCharacters(String market, {CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/markets/$market', cancelToken: cancelToken);
      return MarketResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/markets/$market/$pair/summary', cancelToken: cancelToken);
      return PairResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/markets/$market/$pair/orderbook', cancelToken: cancelToken);
      return OrderBookResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/markets/$market/$pair/trades', cancelToken: cancelToken);
      return TradesResponse.fromJson(response.data as Map<String, dynamic>).result!;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<Graph> getPairGraph(String market, String pair, {String periods = '', String after = '', String before = '', CancelToken? cancelToken}) async {
    try {
      final response =
          await _client.get('/markets/$market/$pair/ohlc', queryParameters: {'periods': periods, 'after': after, 'before': before}, cancelToken: cancelToken);
      return GraphResponse.fromJson(response.data as Map<String, dynamic>).result;
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }

  @override
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/exchanges', cancelToken: cancelToken);
      return ExchangesResponse.fromJson(response.data as Map<String, dynamic>).result.toList()
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        );
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }
}
