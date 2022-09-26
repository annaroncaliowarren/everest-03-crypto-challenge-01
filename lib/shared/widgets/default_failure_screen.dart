import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class DefaultFailureScreen extends StatelessWidget {
  final void Function()? onPressed;

  const DefaultFailureScreen({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets().imageExclamation,
              scale: 15,
            ),
            const SizedBox(height: 15),
            const Text(
              'Oops, algo deu errado',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            const Text(
              'Aguarde alguns instantes e tente novamente',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: AppAssets().colorPink,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Tentar Novamente',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
