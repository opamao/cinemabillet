import 'package:cinemabillet/ecran/accueil/accueil_screen.dart';
import 'package:cinemabillet/ecran/compte/compte_screen.dart';
import 'package:cinemabillet/ecran/notification/notification_screen.dart';
import 'package:cinemabillet/ecran/ticket/ticket_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Cinéma',
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final Widget _accueil = const AccueilScreen();
  final Widget _notification = const NotificationScreen();
  final Widget _ticket = const TicketScreen();
  final Widget _compte = const CompteScreen();

  final List<String> items = [
    'Majestic',
    'Ciné Tic',
    'Cinéma Yacouza',
    'Marcory cinéma',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: getBody(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: SizedBox.fromSize(
          size: const Size(200, 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[850],
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: const Text(
                    '    Sélectionne le cinéma',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            '  $item',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 200,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          SizedBox.fromSize(
            size: const Size(40, 40),
            child: ClipOval(
              child: Material(
                color: Colors.grey.shade800,
                child: InkWell(
                  splashColor: Colors.lightGreenAccent,
                  onTap: () {},
                  child: const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const Gap(5),
          SizedBox.fromSize(
            size: const Size(40, 40),
            child: ClipOval(
              child: Material(
                color: Colors.grey.shade800,
                child: InkWell(
                  splashColor: Colors.lightGreenAccent,
                  onTap: () {},
                  child: Image.asset("assets/images/photo.jpeg"),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBlurEffect(),
    );
  }

  Widget _buildBlurEffect() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.lightGreenAccent,
      strokeColor: Colors.white,
      unSelectedColor: const Color(0xff6c788a),
      backgroundColor: Colors.grey.shade800,
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

  Widget getBody() {
    if (_currentIndex == 0) {
      return _accueil;
    } else if (_currentIndex == 1) {
      return _notification;
    } else if (_currentIndex == 2) {
      return _ticket;
    } else {
      return _compte;
    }
  }
}
