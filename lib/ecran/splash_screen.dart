import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cinemabillet/ecran/menu_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: const Text(
          "Ticket Cinéma",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.lightGreenAccent,
        nextScreen: const MenuScreen(),
      ),
    );
  }
}
