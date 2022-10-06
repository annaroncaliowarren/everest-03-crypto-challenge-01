import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_routes.dart';
import '../../details/provider/details_provider.dart';
import '../../details/view/details_screen.dart';
import '../../transactions/model/transaction_model.dart';
import '../../transactions/provider/transactions_provider.dart';
import '../models/coin_in_portfolio_model.dart';
import '../providers/portfolio_providers.dart';

class ListTilePortfolioScreen extends ConsumerWidget {
  final CryptoViewData crypto;

  const ListTilePortfolioScreen({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider);
    final portfolioData = ref.watch(portfolioModelProvider);
    final listTransactions = ref.watch(listTransactionsProvider.state);
    Decimal customerCurrencyValue = portfolioData.listCoins
        .firstWhere((c) => c.cryptoShortName == crypto.symbol.toUpperCase())
        .currencyCustomerValue;

    CoinInPortfolioModel getAmountCurrency() {
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

    double calculateTransactions(CoinInPortfolioModel coin) {
      for (TransactionModel transaction in listTransactions.state) {
        if (transaction.fromCrypto.symbol.toUpperCase() ==
            coin.cryptoShortName) {
          coin.amountCurrency =
              coin.amountCurrency - transaction.fromValueCrypto.toDouble();
        } else if (transaction.toCrypto.symbol.toUpperCase() ==
            coin.cryptoShortName) {
          coin.amountCurrency =
              coin.amountCurrency + transaction.toValueCrypto.toDouble();
        }
      }
      return coin.amountCurrency;
    }

    Decimal updateCurrentCurrencyValue(double amountUpdated) {
      customerCurrencyValue =
          Decimal.parse(amountUpdated.toString()) * crypto.currentPrice;

      return customerCurrencyValue;
    }

    return ListTile(
      onTap: () {
        ref.read(priceProvider.state).state = crypto.currentPrice;

        Navigator.pushNamed(
          context,
          DetailsScreen.detailsRoute,
          arguments: DetailsArguments(
            crypto: crypto,
            portfolioData: portfolioData,
          ),
        );
      },
      leading: Image.network(
        crypto.image,
        scale: 5,
      ),
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      horizontalTitleGap: 8,
      title: Text(
        crypto.symbol.toUpperCase(),
        style: GoogleFonts.sourceSansPro(
          fontSize: 19,
          color: AppAssets().colorBlack,
        ),
      ),
      subtitle: Text(
        crypto.name,
        style: GoogleFonts.sourceSansPro(
          fontSize: 15,
          color: AppAssets().colorGrey,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isVisible
                    ? UtilBrasilFields.obterReal(
                        updateCurrentCurrencyValue(
                          calculateTransactions(
                            getAmountCurrency(),
                          ),
                        ).toDouble(),
                      )
                    : 'R\$ •••••',
                style: TextStyle(
                  fontSize: 19,
                  color: AppAssets().colorBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isVisible
                    ? '${calculateTransactions(getAmountCurrency()).toStringAsFixed(2)} ${crypto.symbol.toUpperCase()}'
                    : '•••• ${crypto.symbol.toUpperCase()}',
                style: TextStyle(
                  fontSize: 15,
                  color: AppAssets().colorGrey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 3,
            ),
            child: Icon(
              Icons.chevron_right,
              size: 24,
              color: AppAssets().colorGrey,
            ),
          ),
        ],
      ),
    );
  }
}
