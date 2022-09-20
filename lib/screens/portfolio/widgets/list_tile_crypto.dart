import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto_list/screens/details/controller/coin_controller.dart';
import 'package:crypto_list/screens/details/model/coin_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../../details/provider/details_provider.dart';
import '../../details/view/details_screen.dart';
import '../model/crypto_model.dart';
import '../provider/wallet_providers.dart';

class ListTileCrypto extends HookConsumerWidget {
  final CryptoModel cryptoModel;

  const ListTileCrypto({
    Key? key,
    required this.cryptoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider);
    final coins = ref.watch(coinController);
    final valueVariation = ref.watch(valueVariationProvider.state);

    for (CoinModel coin in coins) {
      if (coin.base == cryptoModel.shortName) {
        cryptoModel.amountCurrency =
            (cryptoModel.currencyCustomerValue.toDouble() /
                double.parse(coin.prices.latest));
      }
    }

    return ListTile(
      onTap: () {
        ref.read(spotsController.notifier).generateSpotsList(coins, cryptoModel);
        
        for (CoinModel coin in coins) {
          if (coin.base == cryptoModel.shortName) {
            ref.read(priceProvider.state).state =
                Decimal.parse(coin.prices.latest);
            valueVariation.state = 0;
          }
        }

        Navigator.pushNamed(
          context,
          DetailsScreen.detailsRoute,
          arguments: cryptoModel,
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
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
          color: AppAssets().colorBlack,
        ),
      ),
      subtitle: Text(
        cryptoModel.fullName,
        style: GoogleFonts.sourceSansPro(
          fontSize: 15,
          color: AppAssets().colorGrey,
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
                style: TextStyle(
                  fontSize: 19,
                  color: AppAssets().colorBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isVisible
                    ? '${cryptoModel.amountCurrency.toStringAsFixed(2)} ${cryptoModel.shortName}'
                    : '•••• ${cryptoModel.shortName}',
                style: TextStyle(
                  fontSize: 15,
                  color: AppAssets().colorGrey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 3,
            ),
            child: IconButton(
              onPressed: () {},
              alignment: Alignment.topCenter,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.chevron_right,
                size: 24,
                color: AppAssets().colorGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
