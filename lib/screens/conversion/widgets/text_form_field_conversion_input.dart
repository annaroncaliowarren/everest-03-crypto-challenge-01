import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/conversion_provider.dart';

class TextFormFieldConversionInput extends ConsumerWidget {
  final void Function(String) onChangedTextField;
  final String balanceAvailable;

  const TextFormFieldConversionInput({
    Key? key,
    required this.onChangedTextField,
    required this.balanceAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstSelectedCrypto = ref.watch(firstSelectedCryptoProvider.state);
    final cryptoValueController =
        ref.watch(textFieldCryptoControllerProvider.state);

    bool validateCryptoValueController() {
      if (cryptoValueController.state.text != '') {
        if (double.parse(
                cryptoValueController.state.text.replaceAll(',', '.')) >
            double.parse(balanceAvailable)) {
          return false;
        } else {
          return true;
        }
      }
      return true;
    }

    return TextFormField(
      controller: cryptoValueController.state,
      keyboardType: TextInputType.number,
      cursorColor: Colors.grey.shade400,
      style: const TextStyle(
        fontSize: 31,
        color: Colors.black,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^(\d+)?,?\d{0,10}'),
        ),
      ],
      onChanged: onChangedTextField,
      decoration: InputDecoration(
        errorText:
            validateCryptoValueController() ? null : 'Saldo Insuficiente',
        errorStyle: const TextStyle(
          fontSize: 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            firstSelectedCrypto.state.symbol.toUpperCase(),
            style: const TextStyle(
              fontSize: 31,
              color: Color.fromRGBO(149, 153, 166, 1),
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 0,
          minWidth: 0,
        ),
        hintText: '0,00',
        hintStyle: const TextStyle(
          fontSize: 31,
          color: Color.fromRGBO(149, 153, 166, 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(227, 228, 235, 1),
            width: 2,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(227, 228, 235, 1),
            width: 2,
          ),
        ),
      ),
    );
  }
}
