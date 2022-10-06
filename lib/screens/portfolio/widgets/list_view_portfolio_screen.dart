import 'package:crypto_list/shared/use_case/providers/get_all_crypto_coins_use_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_list_view_data.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../models/coin_in_portfolio_model.dart';
import '../providers/portfolio_providers.dart';
import 'list_tile_portfolio_screen.dart';

class ListViewPortfolioScreen extends ConsumerStatefulWidget {
  final CryptoListViewData data;

  const ListViewPortfolioScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  ConsumerState<ListViewPortfolioScreen> createState() =>
      _ListViewPortfolioScreenState();
}

class _ListViewPortfolioScreenState
    extends ConsumerState<ListViewPortfolioScreen> {

  @override
  void initState() {
    ref.read(portfolioModelProvider.state).state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cryptoData = ref.watch(getAllCryptoCoinsProvider);
    final portfolioData = ref.watch(portfolioModelProvider);
    List<CryptoViewData> listCrypto = [];

    for (CoinInPortfolioModel coin in portfolioData.listCoins) {
      for (CryptoViewData crypto in cryptoData.value!.listCryptoViewData) {
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
