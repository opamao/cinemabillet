import 'package:cinemabillet/utils/route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  TextEditingController _paysController = TextEditingController();

  @override
  void dispose() {
    _paysController.dispose();
    super.dispose();
  }

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
                            "S'enregistrer",
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
                                    Icons.person_outlined,
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
                                  hintText: "Nom",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Nom',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(10),
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
                                    Icons.person_outlined,
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
                                  hintText: "Prénom(s)",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Prénom(s)',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              TextFormField(
                                controller: _paysController,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                    exclude: <String>['KN', 'MF'],
                                    favorite: <String>['CI', 'FR'],
                                    //Optional. Shows phone code before the country name.
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      print('Select country: ${country.displayName}');
                                      setState(() {
                                        _paysController.text = country.name;
                                      });
                                    },
                                    // Optional. Sets the theme for the country list picker.
                                    countryListTheme: CountryListThemeData(
                                      // Optional. Sets the border radius for the bottomsheet.
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40.0),
                                        topRight: Radius.circular(40.0),
                                      ),
                                      // Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'Recherche',
                                        hintText: 'Commencer à saisisr pour rechercher',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      // Optional. Styles the text in the search field
                                      searchTextStyle: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Icons.flag_outlined,
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
                                  hintText: "Votre Pays",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Votre Pays',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
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
                                keyboardType: TextInputType.number,
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
                                    Icons.dialpad_outlined,
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
                                  hintText: "Numéro de téléphone",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Numéro de téléphone',
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
                                "S'enregistrer",
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
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: const Text(
                            "Se connecter",
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
