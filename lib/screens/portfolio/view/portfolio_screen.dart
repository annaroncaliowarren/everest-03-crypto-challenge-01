import 'package:flutter/material.dart';

import '../widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  static const route = '/wallet';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BodyPortfolioScreen(),
        ),
      ),
    );
  }
}

