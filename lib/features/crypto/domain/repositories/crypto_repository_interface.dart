import 'package:crybse/shared/domain/models/exchanges/exchange/exchange.dart';
import 'package:crybse/shared/domain/models/graph/graph/graph.dart';
import 'package:crybse/shared/domain/models/market/pair/pair.dart';
import 'package:crybse/shared/domain/models/orderbook/orderbook/orderbook.dart';
import 'package:crybse/shared/domain/models/pair/pair_summary/pair_summary.dart';
import 'package:crybse/shared/domain/models/trades/trade/trade.dart';

abstract class CryptoRepositoryInterface {
  Future<List<Pair>> getPairs(String market);
  Future<PairSummary> getPairSummary(String makeret, String pair);
  Future<Graph> getPairGraph(String market, String pair, {String periods, String after, String before});
  Future<List<Exchange>> getExchanges();
  Future<OrderBook> getOrderBook(String market, String pair);
  Future<List<Trade>> getTrades(String market, String pair);
}
