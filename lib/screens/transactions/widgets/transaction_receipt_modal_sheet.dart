import 'package:brasil_fields/brasil_fields.dart';
import '../../../shared/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/transaction_model.dart';
import 'list_tile_transaction_receipt.dart';
import 'row_subtitle_transaction_receipt.dart';

class TransactionReceiptModalSheet extends StatelessWidget {
  const TransactionReceiptModalSheet({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 10),
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close_rounded,
              color: Colors.grey.shade600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comprovante\nde conversão',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                Image.asset(
                  AppAssets().imageWarren,
                  scale: 6,
                ),
              ],
            ),
          ),
          Text(
            DateFormat('dd/MM/yyyy - kk:mm:ss')
                .format(transaction.dateConversion),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTileTransactionReceipt(
              title: 'Total',
              trailing: UtilBrasilFields.obterReal(
                transaction.conversionReal.toDouble(),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 22,
          ),
          const RowSubtitleTransactionReceipt(
            title: 'Destino',
            iconTitle: Icons.move_to_inbox_rounded,
          ),
          const Divider(
            thickness: 1,
            height: 22,
          ),
          ListTileTransactionReceipt(
            title: 'Moeda',
            trailing: transaction.toCrypto.name,
          ),
          ListTileTransactionReceipt(
            title: 'Valor',
            trailing:
                '${transaction.toValueCrypto.toStringAsFixed(4).replaceAll('.', ',')} ${transaction.toCrypto.symbol.toUpperCase()}',
          ),
          const Divider(
            thickness: 1,
            height: 22,
          ),
          const RowSubtitleTransactionReceipt(
            title: 'Origem',
            iconTitle: Icons.outbox_rounded,
          ),
          const Divider(
            thickness: 1,
            height: 22,
          ),
          ListTileTransactionReceipt(
            title: 'Moeda',
            trailing: transaction.fromCrypto.name,
          ),
          ListTileTransactionReceipt(
            title: 'Valor',
            trailing:
                '${transaction.fromValueCrypto.toString().replaceAll('.', ',')} ${transaction.fromCrypto.symbol.toUpperCase()}',
          ),
        ],
      ),
    );
  }
}
