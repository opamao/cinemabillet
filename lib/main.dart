import 'package:cinemabillet/ecran/accueil/accueil_screen.dart';
import 'package:cinemabillet/ecran/auth/forgot_screen.dart';
import 'package:cinemabillet/ecran/auth/login_screen.dart';
import 'package:cinemabillet/ecran/auth/register_screen.dart';
import 'package:cinemabillet/ecran/compte/edit_compte_screen.dart';
import 'package:cinemabillet/ecran/menu_screen.dart';
import 'package:cinemabillet/ecran/splash/splash_screen.dart';
import 'package:cinemabillet/utils/page_not_found_screen.dart';
import 'package:cinemabillet/utils/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAT',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen()
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const MenuScreen()
        );
      case Routes.forgot:
        return MaterialPageRoute(
          builder: (context) => const ForgotScreen()
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen()
        );
      case Routes.editProfil:
        return MaterialPageRoute(
          builder: (context) => const EditCompteScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundScreen(),
        );
    }
  }
}
