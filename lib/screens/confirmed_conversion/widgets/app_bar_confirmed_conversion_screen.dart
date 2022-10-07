import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers/index_provider.dart';
import '../../conversion/provider/conversion_provider.dart';
import '../../transactions/view/transactions_screen.dart';

class AppBarConfirmedConversionScreen extends ConsumerWidget
    implements PreferredSizeWidget {
  const AppBarConfirmedConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversionReal = ref.watch(conversionRealProvider.state);
    final cryptoValueController = ref.watch(
      textFieldCryptoControllerProvider.state,
    );
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.black,
        ),
        onPressed: () {
          cryptoValueController.state.clear();
          conversionReal.state = Decimal.parse('0');
          estimatedTotal.state = 0;
          ref.read(selectedIndexBottomNavigationBarProvider.state).state = 1;

          Navigator.pushNamed(
            context,
            TransactionsScreen.transactionsRoute,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
