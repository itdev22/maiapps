import 'package:flutter/material.dart';
import 'package:maiapps/src/dashboard/presentation/view/dashboard.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/1.png")),
            // const Text('LOGO APPS'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Dashboard.routeName,
                );
              },
              child: const Text(
                'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
