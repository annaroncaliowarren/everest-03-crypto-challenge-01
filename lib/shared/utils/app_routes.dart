import 'package:flutter/cupertino.dart';

import '../../screens/movements/view/movements_screen.dart';
import '../../screens/wallet/view/wallet_screen.dart';
import '../widgets/bottom_navigation_bar_app.dart';

Map<String, WidgetBuilder> appRoutes = {
    WalletScreen.route: (context) => const WalletScreen(),
    MovementsScreen.route:(context) => const MovementsScreen(),
    BottomNavigationBarApp.route:(context) => const BottomNavigationBarApp(),
};
