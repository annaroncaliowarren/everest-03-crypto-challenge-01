import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  String id;
  String symbol;
  String name;
  String image;
  Decimal currentPrice;
  double priceChangePercentage24h;

  CryptoResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
  });

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResponseToJson(this);

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{
  //     'id': id,
  //     'symbol': symbol,
  //     'name': name,
  //     'image': image,
  //     'current_price': currentPrice,
  //     'price_change_percentage_24h': priceChangePercentage24h,
  //   };

  //   return result;
  // }

  // factory CryptoResponse.fromMap(Map<String, dynamic> map) {
  //   return CryptoResponse(
  //     id: map['id'] ?? '',
  //     symbol: map['symbol'] ?? '',
  //     name: map['name'] ?? '',
  //     image: map['image'] ?? '',
  //     currentPrice: Decimal.parse(map['current_price'].toString()),
  //     priceChangePercentage24h:
  //         map['price_change_percentage_24h']?.toDouble() ?? 0.0,
  //   );
  // }
}
