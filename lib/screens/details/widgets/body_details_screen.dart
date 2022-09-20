import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../../portfolio/model/crypto_model.dart';
import '../provider/details_provider.dart';
import 'line_chart_details_screen.dart';

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
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cryptoModel.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cryptoModel.shortName,
                      style: TextStyle(
                        fontSize: 17,
                        color: AppAssets().colorGrey,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(cryptoModel.cryptoIcon),
                ),
              ],
            ),
          ),
          Text(
            UtilBrasilFields.obterReal(
              priceController.state.toDouble(),
            ),
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 30,
            ),
            child: LineChartDetailsScreen(
              model: cryptoModel,
            ),
          ),
          ListTile(
            title: Text(
              'Preço atual',
              style: TextStyle(
                color: AppAssets().colorGrey,
                fontSize: 19,
              ),
            ),
            trailing: Text(
              UtilBrasilFields.obterReal(
                priceController.state.toDouble(),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            shape: const Border(
              top: BorderSide(
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Variação 24H',
              style: TextStyle(
                color: AppAssets().colorGrey,
                fontSize: 19,
              ),
            ),
            trailing: Text(
              valueVariation.state <= 0
                  ? '${valueVariation.state.toStringAsFixed(2)}%'
                  : '+${valueVariation.state.toStringAsFixed(2)}%',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                fontSize: 19,
                color: valueVariation.state < 0
                    ? const Color.fromRGBO(205, 26, 26, 0.77)
                    : Colors.green,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            shape: const Border(
              top: BorderSide(
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Quantidade',
              style: TextStyle(
                color: AppAssets().colorGrey,
                fontSize: 19,
              ),
            ),
            trailing: Text(
              '${cryptoModel.amountCurrency.toStringAsFixed(8).replaceAll('.',',')} ${cryptoModel.shortName}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            shape: const Border(
              top: BorderSide(
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Valor',
              style: TextStyle(
                color: AppAssets().colorGrey,
                fontSize: 19,
              ),
            ),
            trailing: Text(
              UtilBrasilFields.obterReal(
                cryptoModel.currencyCustomerValue.toDouble(),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            shape: const Border(
              top: BorderSide(
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: MaterialButton(
              onPressed: () {},
              height: 56,
              minWidth: MediaQuery.of(context).size.width,
              color: AppAssets().colorPink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Converter moeda',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
