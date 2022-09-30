// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoResponse _$CryptoResponseFromJson(Map<String, dynamic> json) =>
    CryptoResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: Decimal.fromJson(json['currentPrice'].toString()),
      priceChangePercentage24h:
          (json['priceChangePercentage24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoResponseToJson(CryptoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'priceChangePercentage24h': instance.priceChangePercentage24h,
    };
