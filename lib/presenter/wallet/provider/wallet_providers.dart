import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_model.dart';

final isVisibleProvider = StateProvider<bool>((ref) => true);

final cryptoModelProvider = StateProvider<CryptoModel>(
  (ref) => CryptoModel(
    shortName: '',
    fullName: '',
    cryptoIcon: '',
    currencyCustomerValue: Decimal.parse(''),
    amountCurrency: 0,
  ),
);
