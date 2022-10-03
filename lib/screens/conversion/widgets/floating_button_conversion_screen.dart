import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../review/view/review_screen.dart';
import '../provider/conversion_provider.dart';

class FloatingButtonConversionScreen extends ConsumerWidget {
  const FloatingButtonConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAble = ref.watch(isAbleFloatingBtnProvider.state);
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);

    showAlertDialog(BuildContext context) {
      Widget cancelButton = TextButton(
        child: const Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      Widget continueButton = TextButton(
        child: const Text(
          'Continuar',
          style: TextStyle(
            color: Color.fromRGBO(224, 43, 87, 1),
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ReviewScreen(),
            ),
          );
        },
      );

      AlertDialog alert = AlertDialog(
        title: const Text(
          'Atenção!',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        content: const Text(
          'Você está tentando converter a mesma moeda. Quer continuar mesmo assim?',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          cancelButton,
          continueButton,
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return FloatingActionButton(
      onPressed: isAble.state
          ? () {
              if (firstSelectedCrypto.state.symbol ==
                  secondSelectedCrypto.state.symbol) {
                showAlertDialog(context);
              } else {
                Navigator.pushNamed(
                  context,
                  ReviewScreen.reviewRoute,
                );
              }
            }
          : null,
      backgroundColor: isAble.state
          ? const Color.fromRGBO(224, 43, 87, 1)
          : const Color.fromRGBO(201, 202, 212, 1),
      elevation: 0,
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}
