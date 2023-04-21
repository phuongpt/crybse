import 'package:crybse/features/market/data/datasource/market_remote_datasource.dart';
import 'package:crybse/features/market/domain/repositories/crypto_repository_interface.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';

class MarketRepositoryImpl implements MarketRepository {
  MarketRepositoryImpl({required this.remoteDataSource});

  final MarketRemoteDatasourceInterface remoteDataSource;

  @override
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken}) async {
    return remoteDataSource.getPairs(market, cancelToken: cancelToken);
  }

  @override
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken}) async {
    return remoteDataSource.getPairSummary(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken}) async {
    return remoteDataSource.getOrderBook(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken}) async {
    return remoteDataSource.getTrades(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<Graph> getPairGraph(String market, String pair, {String periods = '', String after = '', String before = '', CancelToken? cancelToken}) async {
    return remoteDataSource.getPairGraph(market, pair, periods: periods, after: after, before: before, cancelToken: cancelToken);
  }

  @override
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken}) async {
    return remoteDataSource.getExchanges(cancelToken: cancelToken);
  }
}
