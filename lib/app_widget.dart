import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/utils/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio - Crypto List',
      debugShowCheckedModeBanner: false,
      initialRoute: '/portfolio',
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
