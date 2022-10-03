import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/portfolio_model.dart';
import '../provider/conversion_provider.dart';

class RowBalanceAvailable extends ConsumerWidget {
  const RowBalanceAvailable({
    Key? key,
    required this.portfolioData,
  }) : super(key: key);

  final PortfolioModel portfolioData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final balanceAvailable = portfolioData.listCoins
        .firstWhere(
          (crypto) =>
              crypto.cryptoShortName ==
              firstSelectedCrypto.state.symbol.toUpperCase(),
        )
        .amountCurrency
        .toStringAsFixed(8);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      color: const Color.fromRGBO(245, 246, 250, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Saldo disponível',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            '$balanceAvailable ${firstSelectedCrypto.state.symbol.toUpperCase()}',
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(47, 47, 51, 1),
            ),
          ),
        ],
      ),
    );
  }
}
