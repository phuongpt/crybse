class Helper {
  static String convertPairName(String pair) {
    final regex = RegExp(r'^(\w+?)(eth|btc|usdc|usdt|eur|bnb|busd|dai|pax|trx|tusd|xrpbull|xrpbear|usd)?$');
    final match = regex.firstMatch(pair.toLowerCase());

    if (match == null) {
      return pair.toUpperCase();
    }

    final baseAsset = match.group(1)!;

    final quoteAsset = match.group(2);
    if (quoteAsset != null) {
      return '${baseAsset.toUpperCase()}/${quoteAsset.toUpperCase()}';
    } else {
      return pair.toUpperCase();
    }
  }
}
