import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared/widgets/bottom_navigation_bar_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Wallet - Crypto List',
        debugShowCheckedModeBanner: false,
        home: BottomNavigationBarApp(),
      ),
    ),
  );
}


