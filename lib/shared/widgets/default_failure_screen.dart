import 'package:flutter/material.dart';

class DefaultFailureScreen extends StatelessWidget {
  void Function()? onPressed;

  DefaultFailureScreen({
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
              'assets/images/error_404.webp',
              scale: 2,
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(224, 43, 87, 1),
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
                  fontWeight: FontWeight.w500,
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
