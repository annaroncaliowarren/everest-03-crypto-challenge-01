import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/conversion_provider.dart';
import 'floating_button_conversion_screen.dart';

class BottomSheetConversionScreen extends ConsumerWidget {
  const BottomSheetConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondSelectedCrypto = ref.watch(secondSelectedCryptoProvider.state);
    final estimatedTotal = ref.watch(estimatedTotalProvider.state);

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total estimado',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(117, 118, 128, 1),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${estimatedTotal.state.toStringAsFixed(4).replaceAll('.', ',')} ${secondSelectedCrypto.state.symbol.toUpperCase()}',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const FloatingButtonConversionScreen(),
        ],
      ),
    );
  }
}
