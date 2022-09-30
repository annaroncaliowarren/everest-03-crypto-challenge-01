import 'package:decimal/decimal.dart';

class CoinInPortfolioModel {
  String cryptoShortName;
  Decimal currencyCustomerValue;
  double amountCurrency;

  CoinInPortfolioModel({
    required this.cryptoShortName,
    required this.currencyCustomerValue,
    required this.amountCurrency,
  });
}
