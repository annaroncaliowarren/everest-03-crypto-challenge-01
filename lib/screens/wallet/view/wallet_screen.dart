import 'package:flutter/material.dart';

import '../widgets/body_wallet_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  static const route = '/wallet';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: BodyWalletScreen(),
      ),
    );
  }
}

