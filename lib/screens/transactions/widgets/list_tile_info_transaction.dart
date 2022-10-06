import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../model/transaction_model.dart';
import 'transaction_receipt_modal_sheet.dart';

class ListTileInfoTransaction extends StatelessWidget {
  const ListTileInfoTransaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          '${transaction.fromValueCrypto} ${transaction.fromCrypto.symbol.toUpperCase()}',
          style: const TextStyle(
            fontSize: 19,
            color: Color.fromRGBO(117, 118, 128, 1),
          ),
        ),
      ),
      subtitle: Text(
        DateFormat('dd/MM/yyyy').format(transaction.dateConversion),
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(117, 118, 128, 1),
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${transaction.toValueCrypto.toStringAsFixed(4)} ${transaction.toCrypto.symbol.toUpperCase()}',
            style: const TextStyle(
              fontSize: 19,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            UtilBrasilFields.obterReal(
              transaction.conversionReal.toDouble(),
            ),
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
        ],
      ),
      onTap: () {
        showMaterialModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (context) {
            return TransactionReceiptModalSheet(
              transaction: transaction,
            );
          },
        );
      },
    );
  }
}
