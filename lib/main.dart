import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

enum ThemeStyle {
  BlurEffect
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  ThemeStyle _currentStyle = ThemeStyle.BlurEffect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Ticket cinéma",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    switch (_currentStyle) {
      case ThemeStyle.BlurEffect:
        return _buildBlurEffect();
      default:
        return _buildBlurEffect();
    }
  }

  Widget _buildBlurEffect() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.red,
      strokeColor: Colors.white,
      unSelectedColor: const Color(0xff6c788a),
      backgroundColor: Colors.black,
      borderRadius: const Radius.circular(20.0),
      blurEffect: true,
      opacity: 1,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.notifications_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.confirmation_number_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.perm_identity_outlined),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }
}
