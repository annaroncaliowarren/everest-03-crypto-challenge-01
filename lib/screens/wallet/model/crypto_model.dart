import 'dart:convert';

import 'package:decimal/decimal.dart';

class CryptoModel {
  String shortName;
  String fullName;
  String cryptoIcon;
  Decimal currencyCustomerValue;
  double amountCurrency;

  CryptoModel({
    required this.shortName,
    required this.fullName,
    required this.cryptoIcon,
    required this.currencyCustomerValue,
    required this.amountCurrency,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'shortName': shortName,
      'fullName': fullName,
      'cryptoIcon': cryptoIcon,
      'currencyCustomerValue': currencyCustomerValue,
      'amountCurrency': amountCurrency,
    };
    
    return result;
  }

  factory CryptoModel.fromMap(Map<String, dynamic> coin) {
    return CryptoModel(
      shortName: coin['shortName'] ?? '',
      fullName: coin['fullName'] ?? '',
      cryptoIcon: coin['cryptoIcon'] ?? '',
      currencyCustomerValue: Decimal.parse(coin['currencyCustomerValue']),
      amountCurrency: coin['amountCurrency']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoModel.fromJson(String source) =>
      CryptoModel.fromMap(json.decode(source));
}
