import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../../portfolio/model/crypto_model.dart';
import '../provider/details_provider.dart';
import 'button_convert_currency.dart';
import 'line_chart_details_screen.dart';
import 'list_tile_details_crypto.dart';
import 'text_current_price.dart';
import 'top_row_info_crypto.dart';

class BodyDetailsScreen extends ConsumerWidget {
  final CryptoModel cryptoModel;

  const BodyDetailsScreen({
    Key? key,
    required this.cryptoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceController = ref.watch(priceProvider.state);
    final valueVariation = ref.watch(valueVariationProvider.state);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopRowInfoCrypto(
            cryptoModel: cryptoModel,
          ),
          const TextCurrentPrice(),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 30,
            ),
            child: LineChartDetailsScreen(
              model: cryptoModel,
            ),
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Preço atual',
            detailTrailing: UtilBrasilFields.obterReal(
              priceController.state.toDouble(),
            ),
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Variação 24H',
            detailTrailing: valueVariation.state <= 0
                ? '${valueVariation.state.toStringAsFixed(2)}%'
                : '+${valueVariation.state.toStringAsFixed(2)}%',
            trailingColor: valueVariation.state < 0
                ? const Color.fromRGBO(205, 26, 26, 0.77)
                : Colors.green,
            trailingFontWeight: FontWeight.w700,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Quantidade',
            detailTrailing:
                '${cryptoModel.amountCurrency.toStringAsFixed(8).replaceAll('.', ',')} ${cryptoModel.shortName}',
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          ListTileDetailsCrypto(
            detailTitle: 'Valor',
            detailTrailing: UtilBrasilFields.obterReal(
              cryptoModel.currencyCustomerValue.toDouble(),
            ),
            trailingColor: AppAssets().colorBlack,
            trailingFontWeight: FontWeight.normal,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 26),
            child: ButtonConvertCurrency(),
          ),
        ],
      ),
    );
  }
}

