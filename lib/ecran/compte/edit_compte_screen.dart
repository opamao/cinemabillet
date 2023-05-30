import 'package:flutter/material.dart';

class EditCompteScreen extends StatefulWidget {
  const EditCompteScreen({Key? key}) : super(key: key);

  @override
  State<EditCompteScreen> createState() => _EditCompteScreenState();
}

class _EditCompteScreenState extends State<EditCompteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
            onPressed: () {},
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
                'Modifier',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
