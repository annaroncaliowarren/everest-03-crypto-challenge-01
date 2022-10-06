import 'package:flutter/material.dart';

class ListTileTransactionReceipt extends StatelessWidget {
  final String title;
  final String trailing;

  const ListTileTransactionReceipt({
    Key? key,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 19,
        ),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
