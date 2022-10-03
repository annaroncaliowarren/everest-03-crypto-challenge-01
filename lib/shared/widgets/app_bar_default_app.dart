import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class AppBarDefaultApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarDefaultApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: AppAssets().colorBlack,
          fontWeight: FontWeight.w700,
          fontSize: 21,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(
        color: AppAssets().colorBlack,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
