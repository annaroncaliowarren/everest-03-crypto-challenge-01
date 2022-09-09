import 'package:flutter/material.dart';

import 'presenter/wallet/wallet_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      home: WalletScreen(),
    ),
  );
}
