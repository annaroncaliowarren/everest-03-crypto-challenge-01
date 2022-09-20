import '../../../shared/widgets/bottom_navigation_bar_app.dart';
import 'package:flutter/material.dart';

import '../widgets/body_transactions_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static const transactionsRoute = '/transactions';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodyTransactionsScreen(),
      ),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
