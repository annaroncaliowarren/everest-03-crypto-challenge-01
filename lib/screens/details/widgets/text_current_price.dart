import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/details_provider.dart';

class TextCurrentPrice extends ConsumerWidget {
  const TextCurrentPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceController = ref.watch(priceProvider.state);

    return Text(
      UtilBrasilFields.obterReal(
        priceController.state.toDouble(),
      ),
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
    );
  }
}
