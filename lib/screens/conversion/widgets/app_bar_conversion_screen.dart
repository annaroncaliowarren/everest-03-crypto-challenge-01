import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/conversion_provider.dart';

class AppBarConversionScreen extends ConsumerWidget
    implements PreferredSizeWidget {
  const AppBarConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversionReal = ref.watch(conversionRealProvider.state);
    final cryptoValueController =
        ref.watch(textFieldCryptoControllerProvider.state);
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);

    return AppBar(
      title: const Text(
        'Converter',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          cryptoValueController.state.clear();
          conversionReal.state = Decimal.parse('0');
          estimatedTotal.state = 0;
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
