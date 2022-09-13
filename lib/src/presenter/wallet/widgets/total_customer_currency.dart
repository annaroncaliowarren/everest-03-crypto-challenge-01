import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_model.dart';
import '../provider/wallet_providers.dart';

class TotalCurrencyCustomer extends HookConsumerWidget {
  const TotalCurrencyCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider.state).state;
    final cryptos = ref.watch(cryptoNotifier);
    double totalCurrency = 0;

    double getTotalCurrency() {
      for (CryptoModel model in cryptos) {
        totalCurrency += model.currencyCustomerValue.toDouble();
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
          color: const Color.fromRGBO(47, 47, 51, 1),
        ),
      ),
      child: Text(
        UtilBrasilFields.obterReal(getTotalCurrency()),
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          color: const Color.fromRGBO(47, 47, 51, 1),
        ),
      ),
    );
  }
}
