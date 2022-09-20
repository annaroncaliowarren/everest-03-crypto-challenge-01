import 'screens/portfolio/view/portfolio_screen.dart';
import 'shared/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio - Crypto List',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: PortfolioScreen.route,
      onUnknownRoute: (context) {
        return MaterialPageRoute(
          builder: (context) => const PortfolioScreen(),
        );
      },
    );
  }
}
