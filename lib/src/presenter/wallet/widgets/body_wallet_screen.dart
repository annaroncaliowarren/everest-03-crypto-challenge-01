import 'package:flutter/material.dart';

import 'container_top_wallet_screen.dart';
import 'list_view_crypto.dart';

class BodyWalletScreen extends StatelessWidget {
  const BodyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ContainerTopWalletScreen(),
        Expanded(
          child: ListViewCrypto(),
        ),
      ],
    );
  }
}

