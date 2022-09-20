import 'package:flutter/cupertino.dart';

import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/transactions/view/transactions_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
    PortfolioScreen.route: (context) => const PortfolioScreen(),
    TransactionsScreen.route:(context) => const TransactionsScreen(),
};
