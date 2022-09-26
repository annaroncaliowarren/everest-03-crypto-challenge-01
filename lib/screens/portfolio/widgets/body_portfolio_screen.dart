import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_crypto_data_use_case_provider.dart';
import '../../../shared/widgets/default_failure_screen.dart';
import 'container_top_portfolio_screen.dart';
import 'list_tile_portfolio_screen.dart';

class BodyPortfolioScreen extends ConsumerWidget {
  const BodyPortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(cryptoDataProvider);

    return Column(
      children: [
        const ContainerTopPortfolioScreen(),
        Expanded(
          child: cryptoData.when(
            data: (data) => ListView.builder(
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
                ref.refresh(cryptoDataProvider);
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
