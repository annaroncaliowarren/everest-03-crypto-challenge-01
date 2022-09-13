import 'package:flutter/material.dart';

import 'shared/widgets/bottom_navigation_bar_app.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarApp(),
    ),
  );
}


