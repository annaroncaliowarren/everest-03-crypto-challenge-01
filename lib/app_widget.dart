import 'package:flutter/material.dart';

import 'presenter/wallet/wallet_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      home: WalletScreen(),
    );
  }
}
