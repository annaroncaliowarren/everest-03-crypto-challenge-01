import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/wallet_providers.dart';
import 'list_tile_crypto.dart';

class ListViewCrypto extends HookConsumerWidget {
  const ListViewCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoList = ref.watch(cryptoNotifier);

    return Visibility(
      visible: cryptoList.isNotEmpty,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: cryptoList.length,
        itemBuilder: (context, index) {
          return ListTileCrypto(
            cryptoModel: cryptoList[index],
          );
        },
      ),
    );
  }
}
