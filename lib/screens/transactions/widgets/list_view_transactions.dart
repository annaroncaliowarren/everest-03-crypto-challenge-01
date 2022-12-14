import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/transactions_provider.dart';
import 'list_tile_info_transaction.dart';

class ListViewTransactions extends ConsumerWidget {
  const ListViewTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTransactions = ref.watch(listTransactionsProvider.state);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: listTransactions.state.length,
      itemBuilder: (context, index) {
        return ListTileInfoTransaction(
          transaction: listTransactions.state[index],
        );
      },
    );
  }
}
