import 'package:flutter/material.dart';

import 'container_top_portfolio_screen.dart';
import 'list_view_crypto.dart';

class BodyPortfolioScreen extends StatelessWidget {
  const BodyPortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ContainerTopPortfolioScreen(),
        Expanded(
          child: ListViewCrypto(),
        ),
      ],
    );
  }
}

