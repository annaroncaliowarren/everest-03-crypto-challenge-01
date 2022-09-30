import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../portfolio/models/portfolio_model.dart';
import '../provider/conversion_provider.dart';
import 'dropdown_button_crypto_list_conversion.dart';
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
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);
    final conversionReal = ref.watch(conversionRealProvider.state);
    final cryptoValueController =
        ref.watch(textFieldCryptoControllerProvider.state);
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);

    final balanceAvailable = portfolioData.listCoins
        .firstWhere(
          (crypto) =>
              crypto.cryptoShortName ==
              firstSelectedCrypto.state.symbol.toUpperCase(),
        )
        .amountCurrency
        .toStringAsFixed(8);

    Decimal getValueConversionReal() {
      if (cryptoValueController.state.text != '') {
        conversionReal.state = Decimal.parse(
                cryptoValueController.state.text.replaceAll(',', '.')) *
            firstSelectedCrypto.state.currentPrice;
      } else {
        conversionReal.state = Decimal.parse('0');
      }
      return conversionReal.state;
    }

    double getEstimatedTotal() {
      estimatedTotal.state = conversionReal.state.toDouble() /
          secondSelectedCrypto.state.currentPrice.toDouble();
      return estimatedTotal.state;
    }

    bool validateCryptoValueController() {
      if (cryptoValueController.state.text != '') {
        if (double.parse(
                cryptoValueController.state.text.replaceAll(',', '.')) <=
            double.parse(balanceAvailable)) {
          return true;
        } else {
          return false;
        }
      }
      return true;
    }

    floatingBtnIsAble() {
      if (cryptoValueController.state.text != '') {
        if (validateCryptoValueController()) {
          ref.read(isAbleFloatingBtnProvider.state).state = true;
        } else {
          ref.read(isAbleFloatingBtnProvider.state).state = false;
        }
      } else {
        ref.read(isAbleFloatingBtnProvider.state).state = false;
      }
    }

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
              children: [
                DropdownButtonCryptoListConversion(
                  cryptoProvider: firstSelectedCrypto.state,
                  onChangedDropdown: (CryptoViewData? newSelectedCoin) {
                    firstSelectedCrypto.state = newSelectedCoin!;
                    getValueConversionReal();
                    getEstimatedTotal();
                  },
                ),
                const Icon(
                  CupertinoIcons.arrow_right_arrow_left,
                  color: Color.fromRGBO(224, 43, 87, 1),
                  size: 20,
                ),
                DropdownButtonCryptoListConversion(
                  cryptoProvider: secondSelectedCrypto.state,
                  onChangedDropdown: (CryptoViewData? newSelectedCoin) {
                    secondSelectedCrypto.state = newSelectedCoin!;
                    getValueConversionReal();
                    getEstimatedTotal();
                  },
                ),
              ],
            ),
          ),
          TextFormFieldConversionInput(
            balanceAvailable: balanceAvailable,
            onChangedTextField: (value) {
              getValueConversionReal();
              getEstimatedTotal();
              floatingBtnIsAble();
            },
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