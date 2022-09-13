
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
    final result = <String, dynamic>{};
  
    result.addAll({'shortName': shortName});
    result.addAll({'fullName': fullName});
    result.addAll({'cryptoIcon': cryptoIcon});
    result.addAll({'currencyCustomerValue': currencyCustomerValue});
    result.addAll({'amountCurrency': amountCurrency});
  
    return result;
  }

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(
      shortName: map['shortName'] ?? '',
      fullName: map['fullName'] ?? '',
      cryptoIcon: map['cryptoIcon'] ?? '',
      currencyCustomerValue: Decimal.parse(map['currencyCustomerValue']),
      amountCurrency: map['amountCurrency']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoModel.fromJson(String source) => CryptoModel.fromMap(json.decode(source));
}
