import 'package:crypto_list/screens/portfolio/models/portfolio_model.dart';
import 'package:flutter/material.dart';

import '../../screens/details/view/details_screen.dart';
import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/transactions/view/transactions_screen.dart';
import '../use_case/view_data/crypto_view_data.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PortfolioScreen.portfolioRoute:
        return MaterialPageRoute(builder: (_) => const PortfolioScreen());
      case TransactionsScreen.transactionsRoute:
        return MaterialPageRoute(builder: (_) => const TransactionsScreen());
      case DetailsScreen.detailsRoute:
        var crypto = settings.arguments as CryptoViewData;
        var portfolio = settings.arguments as PortfolioModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            crypto: crypto,
            portfolioData: portfolio,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Sem rota definida para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
