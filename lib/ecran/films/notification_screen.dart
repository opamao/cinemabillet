import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
/*
* // pour faire le filtre
* Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search_outlined,
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
                        hintText: "Recherche",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: 'Recherche',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.grey,
                    child: const Icon(
                      Icons.tune_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/fast.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade800,
                    width: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
