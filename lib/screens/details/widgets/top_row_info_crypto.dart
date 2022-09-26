import 'package:flutter/material.dart';

import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';

class TopRowInfoCrypto extends StatelessWidget {
  const TopRowInfoCrypto({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  final CryptoViewData crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                crypto.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                crypto.symbol.toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  color: AppAssets().colorGrey,
                ),
              ),
            ],
          ),
          Image.network(
            crypto.image,
            scale: 4.5,
          ),
        ],
      ),
    );
  }
}
