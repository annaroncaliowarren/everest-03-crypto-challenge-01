import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';

class ListTileDetailsCrypto extends StatelessWidget {
  final String detailTitle;
  final String detailTrailing;
  final Color trailingColor;
  final FontWeight trailingFontWeight;

  const ListTileDetailsCrypto({
    Key? key,
    required this.detailTitle,
    required this.detailTrailing,
    required this.trailingColor,
    required this.trailingFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        detailTitle,
        style: TextStyle(
          color: AppAssets().colorGrey,
          fontSize: 19,
        ),
      ),
      trailing: Text(
        detailTrailing,
        style: TextStyle(
          fontWeight: trailingFontWeight,
          fontSize: 19,
          color: trailingColor,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
    );
  }
}
