import 'package:flutter/material.dart';

import '../widgets/body_transactions_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static const route = '/movements';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyTransactionsScreen(),
    );
  }
}

