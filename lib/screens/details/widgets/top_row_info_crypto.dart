import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';
import '../../portfolio/model/crypto_model.dart';

class TopRowInfoCrypto extends StatelessWidget {
  const TopRowInfoCrypto({
    Key? key,
    required this.cryptoModel,
  }) : super(key: key);

  final CryptoModel cryptoModel;

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
                cryptoModel.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                cryptoModel.shortName,
                style: TextStyle(
                  fontSize: 17,
                  color: AppAssets().colorGrey,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(cryptoModel.cryptoIcon),
          ),
        ],
      ),
    );
  }
}
