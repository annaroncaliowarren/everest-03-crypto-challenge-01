import 'screens/wallet/view/wallet_screen.dart';
import 'shared/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'shared/widgets/bottom_navigation_bar_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: BottomNavigationBarApp.route,
      onUnknownRoute: (context) {
        return MaterialPageRoute(
          builder: (context) => const WalletScreen(),
        );
      },
    );
  }
}
