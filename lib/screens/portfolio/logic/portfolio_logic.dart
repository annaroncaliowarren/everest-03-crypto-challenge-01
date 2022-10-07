import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../transactions/model/transaction_model.dart';
import '../../transactions/provider/transactions_provider.dart';
import '../models/coin_in_portfolio_model.dart';
import '../providers/portfolio_providers.dart';

CoinInPortfolioModel getAmountCurrency(WidgetRef ref, CryptoViewData crypto) {
  final portfolioData = ref.watch(portfolioModelProvider);

  for (CoinInPortfolioModel coin in portfolioData.listCoins) {
    if (coin.cryptoShortName == crypto.symbol.toUpperCase()) {
      coin.amountCurrency = (coin.currencyCustomerValue.toDouble() /
          double.parse(
            crypto.currentPrice.toString(),
          ));
    }
  }
  return portfolioData.listCoins.firstWhere(
    (coin) => coin.cryptoShortName == crypto.symbol.toUpperCase(),
  );
}

double calculateTransactions(WidgetRef ref, CoinInPortfolioModel coin) {
  final listTransactions = ref.watch(listTransactionsProvider.state);
  final portfolioData = ref.watch(portfolioModelProvider);

  for (TransactionModel transaction in listTransactions.state) {
    if (portfolioData.listCoins.any((coin) =>
        coin.cryptoShortName == transaction.toCrypto.symbol.toUpperCase())) {
      if (transaction.fromCrypto.symbol.toUpperCase() == coin.cryptoShortName) {
        coin.amountCurrency -= transaction.fromValueCrypto.toDouble();
      } else if (transaction.toCrypto.symbol.toUpperCase() ==
          coin.cryptoShortName) {
        coin.amountCurrency += transaction.toValueCrypto.toDouble();
      }
    } else {
      portfolioData.listCoins.add(
        CoinInPortfolioModel(
          cryptoShortName: transaction.toCrypto.symbol.toUpperCase(),
          currencyCustomerValue: Decimal.parse('0'),
          amountCurrency: transaction.toValueCrypto.toDouble(),
        ),
      );
    }
  }

  return coin.amountCurrency;
}

Decimal updateCurrentCurrencyValue(
  WidgetRef ref,
  double amountUpdated,
  CryptoViewData crypto,
) {
  final portfolioData = ref.watch(portfolioModelProvider);
  Decimal customerCurrencyValue = portfolioData.listCoins
      .firstWhere((c) => c.cryptoShortName == crypto.symbol.toUpperCase())
      .currencyCustomerValue;

  customerCurrencyValue =
      Decimal.parse(amountUpdated.toString()) * crypto.currentPrice;

  return customerCurrencyValue;
}
