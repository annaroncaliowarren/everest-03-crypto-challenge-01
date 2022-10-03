import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_all_crypto_coins_use_case_provider.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';

class DropdownButtonCryptoListConversion extends ConsumerWidget {
  final CryptoViewData cryptoProvider;
  final void Function(CryptoViewData?) onChangedDropdown;

  const DropdownButtonCryptoListConversion({
    Key? key,
    required this.cryptoProvider,
    required this.onChangedDropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(getAllCryptoCoinsProvider);

    List<CryptoViewData> listCoins = [];

    for (CryptoViewData crypto in cryptoData.value!.listCryptoViewData) {
      listCoins.add(crypto);
    }

    return SizedBox(
      height: 32,
      width: 92,
      child: DropdownButtonFormField(
        items: listCoins.map<DropdownMenuItem<CryptoViewData>>(
          (CryptoViewData coinValue) {
            return DropdownMenuItem(
              value: coinValue,
              child: Row(
                children: [
                  Image.network(
                    coinValue.image,
                    scale: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(coinValue.symbol.toUpperCase()),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: onChangedDropdown,
        value: cryptoProvider,
        style: GoogleFonts.sourceSansPro(
          fontSize: 14,
          color: Colors.black,
        ),
        icon: const Icon(
          Icons.expand_more,
          color: Color.fromRGBO(117, 118, 128, 1),
          size: 17,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(227, 228, 235, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(224, 43, 87, 1),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
