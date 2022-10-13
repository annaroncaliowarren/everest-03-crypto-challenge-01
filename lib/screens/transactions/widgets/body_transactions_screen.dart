import 'package:flutter/material.dart';

import 'list_view_transactions.dart';

class BodyTransactionsScreen extends StatelessWidget {
  const BodyTransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(
              top: 32,
              bottom: 24,
            ),
            child: Text(
              'Movimentações',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: ListViewTransactions(),
          ),
        ],
      ),
    );
  }
}
