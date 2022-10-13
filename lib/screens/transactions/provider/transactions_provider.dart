import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/transaction_model.dart';

final listTransactionsProvider = StateProvider<List<TransactionModel>>((ref) => []);