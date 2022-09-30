import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_crypto_prices_list_use_case_provider.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../portfolio/models/portfolio_model.dart';
import 'button_convert_currency.dart';
import 'line_chart_details_screen.dart';
import 'text_current_price.dart';
import 'top_row_info_crypto.dart';
import 'wrap_list_tile_details_screen.dart';

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
      getCryptoPricesListProvider(
        crypto.name.toLowerCase(),
      ),
    );

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
            error: (error, stackTrace) => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => ref.refresh(
                  getCryptoPricesListProvider(
                    crypto.name.toLowerCase(),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppAssets().colorPink,
                  radius: 22,
                  child: Image.asset(
                    AppAssets().imageRepeatArrow,
                    scale: 22,
                    color: Colors.white,
                  ),
                ),
              ),
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
          WrapListTileDetailsScreen(
            crypto: crypto,
            portfolioData: portfolioData,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: ButtonConvertCurrency(
              portfolioData: portfolioData,
              crypto: crypto,
            ),
          ),
        ],
      ),
    );
  }
}
