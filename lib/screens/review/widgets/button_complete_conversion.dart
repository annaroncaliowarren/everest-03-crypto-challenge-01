import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../confirmed_conversion/view/confirmed_conversion_screen.dart';
import '../../conversion/provider/conversion_provider.dart';
import '../../transactions/model/transaction_model.dart';
import '../../transactions/provider/transactions_provider.dart';

class ButtonCompleteConversion extends ConsumerWidget {
  const ButtonCompleteConversion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoValueController =
        ref.watch(textFieldCryptoControllerProvider.state);
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);
    final conversionReal = ref.watch(conversionRealProvider.state);
    final listTransactions = ref.watch(listTransactionsProvider.state);
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: MaterialButton(
        onPressed: () {
          listTransactions.state.add(
            TransactionModel(
              fromCrypto: firstSelectedCrypto.state,
              toCrypto: secondSelectedCrypto.state,
              fromValueCrypto: Decimal.parse(
                cryptoValueController.state.text.replaceAll(',', '.'),
              ),
              toValueCrypto: Decimal.parse(estimatedTotal.state.toString()),
              dateConversion: DateTime.now(),
              conversionReal: conversionReal.state,
            ),
          );

          Navigator.of(context).push(_createRouteAnimation());
        },
        height: 56,
        minWidth: MediaQuery.of(context).size.width,
        color: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Concluir conversão',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

Route _createRouteAnimation() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ConfirmedConversionScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
