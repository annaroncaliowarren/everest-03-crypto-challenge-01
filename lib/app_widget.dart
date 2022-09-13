import 'package:flutter/material.dart';

import 'src/shared/widgets/bottom_navigation_bar_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarApp(),
    );
  }
}