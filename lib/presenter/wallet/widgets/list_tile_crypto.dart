import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_assets.dart';
import '../model/crypto_model.dart';
import '../provider/wallet_providers.dart';

class ListTileCrypto extends HookConsumerWidget {
  const ListTileCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider.state).state;
    CryptoModel cryptoModel = CryptoModel(
      shortName: 'BTC',
      fullName: 'Bitcoin',
      cryptoIcon: AppAssets().iconBitcoin,
      currencyCustomerValue: Decimal.parse('6577'),
      amountCurrency: 0.65,
    );

    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: const Color.fromRGBO(247, 147, 26, 1),
        child: Image.asset(cryptoModel.cryptoIcon),
      ),
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      horizontalTitleGap: 8,
      title: Text(
        cryptoModel.shortName,
        style: GoogleFonts.sourceSansPro(
          fontSize: 19,
          color: const Color.fromRGBO(47, 47, 51, 1),
        ),
      ),
      subtitle: Text(
        cryptoModel.fullName,
        style: GoogleFonts.sourceSansPro(
          fontSize: 15,
          color: const Color.fromRGBO(117, 118, 128, 1),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isVisible
                    ? UtilBrasilFields.obterReal(
                        cryptoModel.currencyCustomerValue.toDouble())
                    : 'R\$ •••••',
                style: GoogleFonts.nunito(
                  fontSize: 19,
                  color: const Color.fromRGBO(47, 47, 51, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isVisible ? cryptoModel.amountCurrency.toString() : '•••• BTC',
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: const Color.fromRGBO(117, 118, 128, 1),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 5,
            ),
            child: IconButton(
              onPressed: () {},
              alignment: Alignment.topCenter,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.chevron_right,
                size: 24,
                color: Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
