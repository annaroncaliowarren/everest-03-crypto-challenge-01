import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../../conversion/provider/conversion_provider.dart';
import '../../conversion/view/conversion_screen.dart';
import '../../portfolio/models/portfolio_model.dart';

class ButtonConvertCurrency extends ConsumerWidget {
  final PortfolioModel portfolioData;
  final CryptoViewData crypto;

  const ButtonConvertCurrency({
    Key? key,
    required this.portfolioData,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {
        ref.read(firstSelectedCryptoProvider.state).state = crypto;
        ref.read(isAbleFloatingBtnProvider.state).state = false;
        
        Navigator.pushNamed(
          context,
          ConversionScreen.conversionRoute,
          arguments: portfolioData,
        );
      },
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
    );
  }
}
