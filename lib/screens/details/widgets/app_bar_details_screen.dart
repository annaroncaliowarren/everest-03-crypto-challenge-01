import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';

class AppBarDetailsScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Detalhes',
        style: TextStyle(
          color: AppAssets().colorBlack,
          fontWeight: FontWeight.w700,
          fontSize: 21,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 23,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
