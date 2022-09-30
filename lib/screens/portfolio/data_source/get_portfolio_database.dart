import 'package:decimal/decimal.dart';

import '../models/coin_in_portfolio_model.dart';
import '../models/portfolio_model.dart';

class GetPortfolioDatabase {
  PortfolioModel getPortfolioData() {
    return PortfolioModel(
      listCoins: [
        CoinInPortfolioModel(
          cryptoShortName: 'BTC',
          currencyCustomerValue: Decimal.parse('9548'),
          amountCurrency: 0,
        ),
        CoinInPortfolioModel(
          cryptoShortName: 'ETH',
          currencyCustomerValue: Decimal.parse('5684'),
          amountCurrency: 0,
        ),
        CoinInPortfolioModel(
          cryptoShortName: 'LTC',
          currencyCustomerValue: Decimal.parse('548'),
          amountCurrency: 0,
        ),
        CoinInPortfolioModel(
          cryptoShortName: 'DOGE',
          currencyCustomerValue: Decimal.parse('3450'),
          amountCurrency: 0,
        ),
        CoinInPortfolioModel(
          cryptoShortName: 'ADA',
          currencyCustomerValue: Decimal.parse('324'),
          amountCurrency: 0,
        ),
        CoinInPortfolioModel(
          cryptoShortName: 'USDT',
          currencyCustomerValue: Decimal.parse('20302'),
          amountCurrency: 0,
        ),
      ],
    );
  }
}
