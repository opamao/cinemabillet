import 'package:cinemabillet/ecran/ticket/recu_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Seat {
  final String id;
  final int row;
  final int number;
  bool isReserved;
  bool isSelected;

  Seat(
      {required this.id,
      required this.row,
      required this.number,
      this.isReserved = false,
      this.isSelected = false});
}

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  List<Seat> seats = List.generate(
    5,
    (row) => List.generate(
      6,
      (number) => Seat(
        id: '${String.fromCharCode(row + 65)}$number',
        row: row,
        number: number,
      ),
    ),
  ).expand((list) => list).toList();

  int selected = 0;
  int selectedTime = 0;
  String dates = "";
  String jours = "";
  String heures = "";

  Widget customDate(String mois, String jour, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
          dates = mois;
          jours = jour;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: (selected == index)
            ? Colors.lightGreenAccent
            : const Color.fromRGBO(21, 22, 21, 0.3),
        foregroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          color: (selected == index)
              ? const Color.fromRGBO(147, 226, 55, 1)
              : const Color.fromRGBO(21, 22, 21, 0.0),
        ),
      ),
      child: Column(
        children: [
          Text(
            mois,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (selected == index) ? Colors.black : Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            jour,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (selected == index) ? Colors.black : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget customTime(String heure, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedTime = index;
          heures = heure;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: (selectedTime == index)
            ? Colors.lightGreenAccent
            : const Color.fromRGBO(21, 22, 21, 0.3),
        foregroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          color: (selectedTime == index)
              ? const Color.fromRGBO(147, 226, 55, 1)
              : const Color.fromRGBO(21, 22, 21, 0.0),
        ),
      ),
      child: Center(
        child: Text(
          heure,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: (selectedTime == index) ? Colors.black : Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Réservation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: SizedBox.fromSize(
          size: const Size(40, 40),
          child: ClipOval(
            child: Material(
              color: Colors.grey.shade800,
              child: InkWell(
                splashColor: Colors.lightGreenAccent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 6,
                            children: seats.map<Widget>((seat) {
                              return GestureDetector(
                                onTap: () {
                                  if (!seat.isReserved) {
                                    setState(() {
                                      seat.isSelected = !seat.isSelected;
                                    });
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: seat.isReserved
                                        ? Colors.green.shade700
                                        : seat.isSelected
                                            ? Colors.lightGreenAccent
                                            : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.lightGreenAccent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      seat.number.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: seat.isReserved
                                            ? Colors.black
                                            : Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.lightGreenAccent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const Gap(5),
                                const Text(
                                  "Disponible",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade700,
                                    border: Border.all(
                                      color: Colors.green.shade700,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const Gap(5),
                                const Text(
                                  "Réserver",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent,
                                    border: Border.all(
                                      color: Colors.lightGreenAccent,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const Gap(5),
                                const Text(
                                  "Sélectionner",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sélectionner la date",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: customDate(
                                  "Janvier",
                                  "15",
                                  1,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: customDate(
                                  "Janvier",
                                  "16",
                                  2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sélectionner l'heure",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: customTime(
                                  "15:00",
                                  1,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: customTime(
                                  "16:00",
                                  2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecuScreen(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Paiement total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "15 000 FCFA",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.trending_flat_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
