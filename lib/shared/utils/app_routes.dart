import 'package:flutter/material.dart';

import '../../screens/details/view/details_screen.dart';
import '../../screens/portfolio/model/crypto_model.dart';
import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/transactions/view/transactions_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PortfolioScreen.portfolioRoute:
        return MaterialPageRoute(builder: (_) => const PortfolioScreen());
      case TransactionsScreen.transactionsRoute:
        return MaterialPageRoute(builder: (_) => const TransactionsScreen());
      case DetailsScreen.detailsRoute:
        var model = settings.arguments as CryptoModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            cryptoModel: model,
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
