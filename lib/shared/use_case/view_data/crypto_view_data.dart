import 'package:decimal/decimal.dart';

class CryptoViewData {
  String id;
  String symbol;
  String name;
  String image;
  Decimal currentPrice;
  double priceChangePercentage24h;

  CryptoViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
  });
}
