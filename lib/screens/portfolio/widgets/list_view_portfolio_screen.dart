import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_list_view_data.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../models/coin_in_portfolio_model.dart';
import '../providers/portfolio_providers.dart';
import 'list_tile_portfolio_screen.dart';

class ListViewPortfolioScreen extends ConsumerWidget {
  final CryptoListViewData data;

  const ListViewPortfolioScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioData = ref.watch(portfolioModelProvider);
    
    List<CryptoViewData> listCrypto = [];

    for (CoinInPortfolioModel coin in portfolioData.listCoins) {
      for (CryptoViewData crypto in data.listCryptoViewData) {
        if (coin.cryptoShortName == crypto.symbol.toUpperCase()) {
          listCrypto.add(crypto);
        }
      }
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: listCrypto.length,
      itemBuilder: (context, index) {
        final crypto = listCrypto[index];

        return ListTilePortfolioScreen(
          crypto: crypto,
        );
      },
    );
  }
}
