import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../../../shared/widgets/list_tile_info_default_app.dart';
import '../../conversion/provider/conversion_provider.dart';

class WrapListTileReviewScreen extends ConsumerWidget {
  const WrapListTileReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoValueController =
        ref.watch(textFieldCryptoControllerProvider.state);
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);
    final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);

    final exchangeValue = firstSelectedCrypto.state.currentPrice.toDouble() /
        secondSelectedCrypto.state.currentPrice.toDouble();

    return Wrap(
      children: [
        ListTileInfoDefaultApp(
          detailTitle: 'Converter',
          detailTrailing:
              '${cryptoValueController.state.text.replaceAll(',', '.')} ${firstSelectedCrypto.state.symbol.toUpperCase()}',
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
        ListTileInfoDefaultApp(
          detailTitle: 'Receber',
          detailTrailing:
              '${estimatedTotal.state.toStringAsFixed(4)} ${secondSelectedCrypto.state.symbol.toUpperCase()}',
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
        ListTileInfoDefaultApp(
          detailTitle: 'Câmbio',
          detailTrailing:
              '1 ${firstSelectedCrypto.state.symbol.toUpperCase()} = ${exchangeValue.toStringAsFixed(2)} ${secondSelectedCrypto.state.symbol.toUpperCase()}',
          trailingColor: AppAssets().colorBlack,
          trailingFontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
