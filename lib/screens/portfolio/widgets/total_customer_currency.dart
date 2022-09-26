import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../models/coin_in_portfolio_model.dart';
import '../providers/portfolio_providers.dart';

class TotalCurrencyCustomer extends ConsumerWidget {
  const TotalCurrencyCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider);
    final listCryptoPortfolio = ref.watch(portfolioModelProvider);
    double totalCurrency = 0;

    double getTotalCurrency() {
      for (CoinInPortfolioModel coin in listCryptoPortfolio.listCoins) {
        totalCurrency += coin.currencyCustomerValue.toDouble();
      }
      return totalCurrency;
    }

    return Visibility(
      visible: isVisible,
      replacement: Text(
        'R\$ •••••',
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          color: AppAssets().colorBlack,
        ),
      ),
      child: Text(
        UtilBrasilFields.obterReal(getTotalCurrency()),
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          color: AppAssets().colorBlack,
        ),
      ),
    );
  }
}
