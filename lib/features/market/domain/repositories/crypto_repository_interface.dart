import 'package:crybse/shared/domain/models/exchanges/exchange/exchange.dart';
import 'package:crybse/shared/domain/models/graph/graph/graph.dart';
import 'package:crybse/shared/domain/models/market/pair/pair.dart';
import 'package:crybse/shared/domain/models/orderbook/orderbook/orderbook.dart';
import 'package:crybse/shared/domain/models/pair/pair_summary/pair_summary.dart';
import 'package:crybse/shared/domain/models/trades/trade/trade.dart';
import 'package:dio/dio.dart';

abstract class MarketRepository {
  Future<List<Pair>> getPairs(String market, {CancelToken? cancelToken});
  Future<PairSummary> getPairSummary(String market, String pair, {CancelToken? cancelToken});
  Future<Graph> getPairGraph(String market, String pair, {String periods, String after, String before, CancelToken? cancelToken});
  Future<List<Exchange>> getExchanges({CancelToken? cancelToken});
  Future<OrderBook> getOrderBook(String market, String pair, {CancelToken? cancelToken});
  Future<List<Trade>> getTrades(String market, String pair, {CancelToken? cancelToken});
}
