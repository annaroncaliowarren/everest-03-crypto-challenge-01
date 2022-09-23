import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navigation_bar_app.dart';
import '../widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  static const portfolioRoute = '/portfolio';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodyPortfolioScreen(),
      ),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
