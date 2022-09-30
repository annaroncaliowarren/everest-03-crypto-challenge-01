import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_all_crypto_coins_use_case_provider.dart';
import '../../../shared/widgets/default_failure_screen.dart';
import 'container_top_portfolio_screen.dart';
import 'list_tile_portfolio_screen.dart';

class BodyPortfolioScreen extends ConsumerWidget {
  const BodyPortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoCoins = ref.watch(getAllCryptoCoinsProvider);

    return Column(
      children: [
        const ContainerTopPortfolioScreen(),
        Expanded(
          child: cryptoCoins.when(
            data: (data) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.listCryptoViewData.length,
              itemBuilder: (context, index) {
                final crypto = data.listCryptoViewData[index];

                return ListTilePortfolioScreen(
                  crypto: crypto,
                );
              },
            ),
            error: (error, stackTrace) => DefaultFailureScreen(
              onPressed: () {
                ref.refresh(getAllCryptoCoinsProvider);
              },
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
                strokeWidth: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
