import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/providers/get_all_crypto_coins_use_case_provider.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';

final firstSelectedCryptoProvider = StateProvider<CryptoViewData>(
  (ref) => CryptoViewData(
    id: 'id',
    symbol: 'symbol',
    name: 'name',
    image: 'image',
    currentPrice: Decimal.parse('0'),
    priceChangePercentage24h: 0,
  ),
);

final secondSelectedCryptoProvider = StateProvider<CryptoViewData>(
  (ref) {
    return ref.read(getAllCryptoCoinsProvider).value!.listCryptoViewData.first;
  }
);

final textFieldCryptoControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());

final conversionRealProvider = StateProvider<Decimal>((ref) => Decimal.parse('0'));

final estimatedTotalProvider = StateProvider<double>((ref) => 0);

final isAbleFloatingBtnProvider = StateProvider<bool>((ref) => false);