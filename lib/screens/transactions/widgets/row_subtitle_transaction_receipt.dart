import 'package:flutter/material.dart';

class RowSubtitleTransactionReceipt extends StatelessWidget {
  final String title;
  final IconData iconTitle;

  const RowSubtitleTransactionReceipt({
    Key? key,
    required this.title,
    required this.iconTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconTitle,
          size: 25,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
