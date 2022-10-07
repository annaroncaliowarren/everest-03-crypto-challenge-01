import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto_list/screens/portfolio/logic/portfolio_logic.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/list_tile_info_default_app.dart';
import '../../portfolio/models/coin_in_portfolio_model.dart';
import '../../portfolio/models/portfolio_model.dart';
import '../provider/details_provider.dart';

class WrapListTileDetailsScreen extends ConsumerWidget {
  const WrapListTileDetailsScreen({
    Key? key,
    required this.crypto,
    required this.portfolioData,
  }) : super(key: key);

  final CryptoViewData crypto;
  final PortfolioModel portfolioData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Wrap(
      children: [
        ListTileInfoDefaultApp(
          detailTitle: 'Preço atual',
          detailTrailing: UtilBrasilFields.obterReal(
            currentPrice.toDouble(),
          ),
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
        ListTileInfoDefaultApp(
          detailTitle: 'Variação 24H',
          detailTrailing: crypto.priceChangePercentage24h <= 0
              ? '${crypto.priceChangePercentage24h.toStringAsFixed(2)}%'
              : '+${crypto.priceChangePercentage24h.toStringAsFixed(2)}%',
          trailingColor: crypto.priceChangePercentage24h < 0
              ? const Color.fromRGBO(205, 26, 26, 0.77)
              : Colors.green,
          trailingFontWeight: FontWeight.w700,
        ),
        ListTileInfoDefaultApp(
          detailTitle: 'Quantidade',
          detailTrailing:
              '${getCoinInPortfolioData().amountCurrency.toStringAsFixed(8).replaceAll('.', ',')} ${crypto.symbol.toUpperCase()}',
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
        ListTileInfoDefaultApp(
          detailTitle: 'Valor',
          detailTrailing: UtilBrasilFields.obterReal(
            updateCurrentCurrencyValue(
              ref,
              getCoinInPortfolioData().amountCurrency,
              crypto,
            ).toDouble(),
          ),
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
