import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_list_view_data.dart';
import 'list_tile_portfolio_screen.dart';

class ListViewPortfolioScreen extends ConsumerWidget {
  final CryptoListViewData data;

  const ListViewPortfolioScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.listCryptoViewData.length,
      itemBuilder: (context, index) {
        final crypto = data.listCryptoViewData[index];

        return ListTilePortfolioScreen(
          crypto: crypto,
        );
      },
    );
  }
}