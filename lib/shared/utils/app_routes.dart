import 'package:flutter/material.dart';

import '../../screens/details/view/details_screen.dart';
import '../../screens/portfolio/model/crypto_model.dart';
import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/transactions/view/transactions_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/portfolio':
        return MaterialPageRoute(builder: (_) => const PortfolioScreen());
      case '/transactions':
        return MaterialPageRoute(builder: (_) => const TransactionsScreen());
      case '/portfolio/details':
        var model = settings.arguments as CryptoModel;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            cryptoModel: model,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
