import 'package:crypto_list/screens/confirmed_conversion/view/confirmed_conversion_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/conversion/view/conversion_screen.dart';
import '../../screens/details/view/details_screen.dart';
import '../../screens/portfolio/models/portfolio_model.dart';
import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/review/view/review_screen.dart';
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
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as DetailsArguments;
            return DetailsScreen(
              crypto: arguments.crypto,
              portfolioData: arguments.portfolioData,
            );
          },
        );
      case ConversionScreen.conversionRoute:
        return MaterialPageRoute(
          builder: (_) {
            final conversionArg = settings.arguments as PortfolioModel;
            return ConversionScreen(
              portfolioData: conversionArg,
            );
          },
        );
      case ReviewScreen.reviewRoute:
        return MaterialPageRoute(builder: (_) => const ReviewScreen());
      case ConfirmedConversionScreen.confirmedConversionRoute:
        return MaterialPageRoute(builder: (_) => const ConfirmedConversionScreen());
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

class DetailsArguments {
  final CryptoViewData crypto;
  final PortfolioModel portfolioData;

  DetailsArguments({
    required this.crypto,
    required this.portfolioData,
  });
}
