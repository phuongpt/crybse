import 'package:crybse/features/market/domain/repositories/crypto_repository_interface.dart';
import 'package:crybse/shared/domain/models/model.dart';
import 'package:dio/dio.dart';

class MarketUsecase implements MarketRepository {
  MarketUsecase({required this.repository});

  final MarketRepository repository;

  @override
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken}) {
    return repository.getPairs(market, cancelToken: cancelToken);
  }

  @override
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken}) {
    return repository.getPairSummary(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken}) {
    return repository.getTrades(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken}) {
    return repository.getOrderBook(market, pair, cancelToken: cancelToken);
  }

  @override
  Future<Graph> getPairGraph(String market, String pair, {String periods = '', String after = '', String before = '', CancelToken? cancelToken}) {
    return repository.getPairGraph(market, pair, periods: periods, after: after, before: before, cancelToken: cancelToken);
  }

  @override
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken}) async {
    return repository.getExchanges(cancelToken: cancelToken);
  }
}
