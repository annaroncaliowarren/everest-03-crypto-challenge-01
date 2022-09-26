import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_crypto_prices_list_use_case_provider.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/default_failure_screen.dart';
import '../../portfolio/models/coin_in_portfolio_model.dart';
import '../../portfolio/models/portfolio_model.dart';
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
    CoinInPortfolioModel? coinInPortfolio;

    final currentPrice = ref.watch(priceProvider);
    final listCryptoPrices = ref.watch(
      getCryptoPricesListProvider(
        crypto.name.toLowerCase(),
      ),
    );

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
            data: (data) => LineChartDetailsScreen(
              listPricesCrypto: data,
              crypto: crypto,
            ),
            error: (error, stackTrace) => DefaultFailureScreen(
              onPressed: () {
                ref.refresh(
                  getCryptoPricesListProvider(
                    crypto.name.toLowerCase(),
                  ),
                );
              },
            ),
            loading: () => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
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
