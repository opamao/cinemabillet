import 'package:cinemabillet/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompteScreen extends StatefulWidget {
  const CompteScreen({Key? key}) : super(key: key);

  @override
  State<CompteScreen> createState() => _CompteScreenState();
}

class _CompteScreenState extends State<CompteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox.fromSize(
                  size: const Size(100, 100),
                  child: ClipOval(
                    child: Image.asset("assets/images/photo.jpeg"),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey,
                        child: InkWell(
                          splashColor: Colors.lightGreenAccent,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfil);
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Theodore YAPI",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "0585831647",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_forwarded_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Nous contacter",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Politiques & confidentialités",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.library_books_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Termes & conditions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Se déconnecter",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
