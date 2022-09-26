import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto_list/screens/portfolio/models/coin_in_portfolio_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/portfolio_model.dart';

import '../../../shared/use_case/providers/get_crypto_prices_list_use_case_provider.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/default_failure_screen.dart';
import '../provider/details_provider.dart';
import 'button_convert_currency.dart';
import 'line_chart_details_screen.dart';
import 'list_tile_details_crypto.dart';
import 'text_current_price.dart';
import 'top_row_info_crypto.dart';

class BodyDetailsScreen extends ConsumerWidget {
  final CryptoViewData crypto;
  final PortfolioModel portfolioData;

  const BodyDetailsScreen({
    Key? key,
    required this.crypto,
    required this.portfolioData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCryptoPrices = ref.watch(
      cryptoPricesListProvider(
        crypto.name.toLowerCase(),
      ),
    );
    final currentPrice = ref.watch(priceProvider);
    CoinInPortfolioModel? coinInPortfolio;

    CoinInPortfolioModel getCoinInPortfolioData() {
      for (CoinInPortfolioModel coin in portfolioData.listCoins) {
        if (coin.cryptoShortName == crypto.symbol.toUpperCase()) {
          coinInPortfolio = coin;
        } 
      }
      return coinInPortfolio!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopRowInfoCrypto(
            crypto: crypto,
          ),
          const TextCurrentPrice(),
          listCryptoPrices.when(
            data: (data) => Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 30,
              ),
              child: LineChartDetailsScreen(
                listPricesCrypto: data,
                crypto: crypto,
              ),
            ),
            error: (error, stackTrace) => DefaultFailureScreen(
              onPressed: () {
                ref.refresh(
                  cryptoPricesListProvider(
                    crypto.name.toLowerCase(),
                  ),
                );
              },
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
                strokeWidth: 3,
              ),
            ),
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Preço atual',
            detailTrailing: UtilBrasilFields.obterReal(
              currentPrice.toDouble(),
            ),
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Variação 24H',
            detailTrailing: crypto.priceChangePercentage24h <= 0
                ? '${crypto.priceChangePercentage24h.toStringAsFixed(2)}%'
                : '+${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
            trailingColor: crypto.priceChangePercentage24h < 0
                ? const Color.fromRGBO(205, 26, 26, 0.77)
                : Colors.green,
            trailingFontWeight: FontWeight.w700,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Quantidade',
            detailTrailing:
                '${getCoinInPortfolioData().amountCurrency.toStringAsFixed(8).replaceAll('.', ',')} ${crypto.symbol.toUpperCase()}',
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Valor',
            detailTrailing: UtilBrasilFields.obterReal(
              getCoinInPortfolioData().currencyCustomerValue.toDouble(),
            ),
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 26),
            child: ButtonConvertCurrency(),
          ),
        ],
      ),
    );
  }
}
