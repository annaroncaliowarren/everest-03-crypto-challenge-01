import 'package:flutter/material.dart';

import '../../portfolio/models/portfolio_model.dart';
import '../widgets/app_bar_conversion_screen.dart';
import '../widgets/body_conversion_screen.dart';
import '../widgets/bottom_sheet_conversion_screen.dart';

class ConversionScreen extends StatelessWidget {
  final PortfolioModel portfolioData;

  const ConversionScreen({
    Key? key,
    required this.portfolioData,
  }) : super(key: key);

  static const conversionRoute = '/portfolio/details/conversion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarConversionScreen(),
      body: BodyConversionScreen(
        portfolioData: portfolioData,
      ),
      bottomSheet: const BottomSheetConversionScreen(),
    );
  }
}
