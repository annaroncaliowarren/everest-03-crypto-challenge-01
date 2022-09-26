import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_prices_list_response.g.dart';

@JsonSerializable()
class CryptoPricesListResponse {
  List<Decimal> listPrices;

  CryptoPricesListResponse({
    required this.listPrices,
  });

  factory CryptoPricesListResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoPricesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoPricesListResponseToJson(this);
}
