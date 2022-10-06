import 'package:flutter/material.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/widgets/app_bar_default_app.dart';
import '../../portfolio/models/portfolio_model.dart';
import '../widgets/body_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  final CryptoViewData crypto;
  final PortfolioModel portfolioData;

  const DetailsScreen({
    Key? key,
    required this.crypto,
    required this.portfolioData,
  }) : super(key: key);

  static const detailsRoute = '/portfolio/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDefaultApp(
        title: 'Detalhes',
      ),
      body: SingleChildScrollView(
        child: BodyDetailsScreen(
          crypto: crypto,
          portfolioData: portfolioData,
        ),
      ),
    );
  }
}
