import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/wallet_providers.dart';

class VisibilityIconButton extends HookConsumerWidget {
  const VisibilityIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isVisible = ref.watch(isVisibleProvider);

    return IconButton(
      onPressed: () {
        ref.read(isVisibleProvider.state).state = !isVisible;
      },
      padding: EdgeInsets.zero,
      icon: Icon(
        isVisible ? Icons.visibility : Icons.visibility_off,
        size: 22,
      ),
    );
  }
}
