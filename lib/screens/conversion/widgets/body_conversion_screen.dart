import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/portfolio_model.dart';
import '../provider/conversion_provider.dart';
import 'dropdown_button_right_crypto_list_conversion.dart';
import 'dropdown_button_left_portfolio_list_conversion.dart';
import 'row_balance_available.dart';
import 'text_form_field_conversion_input.dart';

class BodyConversionScreen extends ConsumerWidget {
  const BodyConversionScreen({
    Key? key,
    required this.portfolioData,
  }) : super(key: key);

  final PortfolioModel portfolioData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversionReal = ref.watch(conversionRealProvider.state);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowBalanceAvailable(
            portfolioData: portfolioData,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 24,
              bottom: 16,
            ),
            child: Text(
              'Quanto você gostaria de converter?',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DropdownButtonLeftPortfolioListConversion(),
                Icon(
                  CupertinoIcons.arrow_right_arrow_left,
                  color: Color.fromRGBO(224, 43, 87, 1),
                  size: 20,
                ),
                DropdownButtonRightCryptoListConversion(),
              ],
            ),
          ),
          TextFormFieldConversionInput(
            portfolioData: portfolioData,
          ),
          const SizedBox(height: 8),
          Text(
            UtilBrasilFields.obterReal(conversionReal.state.toDouble()),
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
        ],
      ),
    );
  }
}
