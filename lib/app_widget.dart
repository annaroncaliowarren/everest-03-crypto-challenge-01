import 'shared/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portfolio - Crypto List',
      debugShowCheckedModeBanner: false,
      initialRoute: '/portfolio',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
