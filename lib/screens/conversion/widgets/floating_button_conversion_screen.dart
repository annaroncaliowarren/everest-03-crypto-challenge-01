import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/conversion_provider.dart';

class FloatingButtonConversionScreen extends ConsumerWidget {
  const FloatingButtonConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAble = ref.watch(isAbleFloatingBtnProvider.state);

    return FloatingActionButton(
      onPressed: isAble.state ? () {} : null,
      backgroundColor: isAble.state
          ? const Color.fromRGBO(224, 43, 87, 1)
          : const Color.fromRGBO(201, 202, 212, 1),
      elevation: 0,
      child: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}
