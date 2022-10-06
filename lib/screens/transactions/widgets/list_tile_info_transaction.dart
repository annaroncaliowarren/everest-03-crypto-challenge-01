import 'package:brasil_fields/brasil_fields.dart';
import '../../../shared/utils/app_assets.dart';
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
          style: TextStyle(
            fontSize: 19,
            color: AppAssets().colorGrey,
          ),
        ),
      ),
      subtitle: Text(
        DateFormat('dd/MM/yyyy').format(transaction.dateConversion),
        style: TextStyle(
          fontSize: 15,
          color: AppAssets().colorGrey,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${transaction.toValueCrypto.toStringAsFixed(4)} ${transaction.toCrypto.symbol.toUpperCase()}',
            style: TextStyle(
              fontSize: 19,
              color: AppAssets().colorBlack,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            UtilBrasilFields.obterReal(
              transaction.conversionReal.toDouble(),
            ),
            style: TextStyle(
              fontSize: 15,
              color: AppAssets().colorGrey,
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
