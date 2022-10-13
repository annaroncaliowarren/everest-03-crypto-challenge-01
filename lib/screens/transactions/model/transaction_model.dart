import 'package:decimal/decimal.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';

class TransactionModel {
  CryptoViewData fromCrypto;
  CryptoViewData toCrypto;
  Decimal fromValueCrypto;
  Decimal toValueCrypto;
  DateTime dateConversion;
  Decimal conversionReal;

  TransactionModel({
    required this.fromCrypto,
    required this.toCrypto,
    required this.fromValueCrypto,
    required this.toValueCrypto,
    required this.dateConversion,
    required this.conversionReal,
  });
}