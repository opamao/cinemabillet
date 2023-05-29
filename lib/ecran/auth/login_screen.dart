import 'package:cinemabillet/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Connexion",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey.shade700,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.lightGreenAccent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.grey,
                                  hintText: "E-mail",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'E-mail',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              TextFormField(
                                obscureText: _isObscure,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Icons.lock_outlined,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.lightGreenAccent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.grey,
                                  hintText: "Mot de passe",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Mot de passe',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.forgot);
                          },
                          child: const Text(
                            "J'ai oublié mon mot de passe",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.home);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Se connecter',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Divider(
                                thickness: 2,
                                color: Colors.grey.shade700,
                              ),
                              const Text(
                                "OU",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15),
                              ),
                              Divider(
                                thickness: 2,
                                color: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          child: const Text(
                            "S'enregistrer",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
