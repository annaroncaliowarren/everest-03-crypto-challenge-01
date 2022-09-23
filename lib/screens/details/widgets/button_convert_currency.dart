import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';

class ButtonConvertCurrency extends StatelessWidget {
  const ButtonConvertCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 56,
      minWidth: MediaQuery.of(context).size.width,
      color: AppAssets().colorPink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Converter moeda',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
    );
  }
}
