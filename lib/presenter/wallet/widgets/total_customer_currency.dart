import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/wallet_providers.dart';

class TotalCurrencyCustomer extends HookConsumerWidget {
  const TotalCurrencyCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider.state).state;

    return Visibility(
      visible: isVisible,
      replacement: Text(
        'R\$ •••••',
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          color: const Color.fromRGBO(47, 47, 51, 1),
        ),
      ),
      child: Text(
        UtilBrasilFields.obterReal(14798),
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          color: const Color.fromRGBO(47, 47, 51, 1),
        ),
      ),
    );
  }
}
