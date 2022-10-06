import 'package:crypto_list/screens/portfolio/models/portfolio_model.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/conversion_provider.dart';

Decimal getValueConversionReal(WidgetRef ref) {
  final cryptoValueController = ref.watch(
    textFieldCryptoControllerProvider.state,
  );
  final conversionReal = ref.watch(conversionRealProvider.state);
  final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);

  if (cryptoValueController.state.text != '') {
    conversionReal.state =
        Decimal.parse(cryptoValueController.state.text.replaceAll(',', '.')) *
            firstSelectedCrypto.state.currentPrice;
  } else {
    conversionReal.state = Decimal.parse('0');
  }
  return conversionReal.state;
}

double getEstimatedTotal(WidgetRef ref) {
  final conversionReal = ref.watch(conversionRealProvider.state);
  final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);
  final estimatedTotal = ref.watch(estimatedTotalProvider.state);

  estimatedTotal.state = conversionReal.state.toDouble() /
      secondSelectedCrypto.state.currentPrice.toDouble();
  return estimatedTotal.state;
}

bool validateCryptoValueController(
    WidgetRef ref, PortfolioModel portfolioData) {
  final cryptoValueController = ref.watch(
    textFieldCryptoControllerProvider.state,
  );
  final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
  final balanceAvailable = portfolioData.listCoins
      .firstWhere(
        (crypto) =>
            crypto.cryptoShortName ==
            firstSelectedCrypto.state.symbol.toUpperCase(),
      )
      .amountCurrency
      .toStringAsFixed(8);

  if (cryptoValueController.state.text != '') {
    if (double.parse(cryptoValueController.state.text.replaceAll(',', '.')) <=
        double.parse(balanceAvailable)) {
      return true;
    } else {
      return false;
    }
  }
  return true;
}

floatingBtnIsAble(WidgetRef ref, PortfolioModel portfolioData) {
  final cryptoValueController = ref.watch(
    textFieldCryptoControllerProvider.state,
  );

  if (cryptoValueController.state.text != '') {
    if (validateCryptoValueController(ref, portfolioData)) {
      ref.read(isAbleFloatingBtnProvider.state).state = true;
    } else {
      ref.read(isAbleFloatingBtnProvider.state).state = false;
    }
  } else {
    ref.read(isAbleFloatingBtnProvider.state).state = false;
  }
}
