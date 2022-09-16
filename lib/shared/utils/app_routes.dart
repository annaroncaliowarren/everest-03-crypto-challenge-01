import 'package:flutter/cupertino.dart';

import '../../screens/transactions/view/transactions_screen.dart';
import '../../screens/portfolio/view/portfolio_screen.dart';
import '../widgets/bottom_navigation_bar_app.dart';

Map<String, WidgetBuilder> appRoutes = {
    PortfolioScreen.route: (context) => const PortfolioScreen(),
    TransactionsScreen.route:(context) => const TransactionsScreen(),
    BottomNavigationBarApp.route:(context) => const BottomNavigationBarApp(),
};
