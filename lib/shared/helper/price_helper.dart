class PriceHelper {
  static String formatPrice(double price, int decimalNumber) {
    var formattedPrice = price.toStringAsFixed(decimalNumber);
    if (formattedPrice.contains('.')) {
      formattedPrice = formattedPrice.replaceAll(RegExp(r'0+$'), '');
      formattedPrice = formattedPrice.replaceAll(RegExp(r'\.$'), '');
    }
    return formattedPrice;
  }
}
