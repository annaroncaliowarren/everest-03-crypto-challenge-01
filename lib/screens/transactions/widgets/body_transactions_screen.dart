import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/transactions_provider.dart';
import 'list_tile_info_transaction.dart';

class BodyTransactionsScreen extends ConsumerWidget {
  const BodyTransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTransactions = ref.watch(listTransactionsProvider.state);
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listTransactions.state.length,
                itemBuilder: (context, index) {
                  return ListTileInfoTransaction(
                    transaction: listTransactions.state[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
