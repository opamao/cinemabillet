import 'package:cinemabillet/ecran/accueil/recap_recu_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Seat {
  String? id;
  int? row;
  final int number;
  bool isReserved;
  bool isSelected;

  Seat({
    this.id,
    this.row,
    required this.number,
    this.isReserved = false,
    this.isSelected = false,
  });
}

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

/*
 [
 S,S,S,S,V,V,S,S,S,S

 ]
 */
class _SelectDateScreenState extends State<SelectDateScreen> {
  int selected = 0;
  int selectedTime = 0;
  String dates = "";
  String jours = "";
  String heures = "";

  List<int> reservedSeatIndex = [0, 2, 3, 12, 13];

  List<Seat> seats = [];

  @override
  void initState() {
    seats = List.generate(
      50,
      (index) {
        var emptySeat = index % 10 == 4 || index % 10 == 5;
        return Seat(
            id: '${String.fromCharCode(index + 65)}$index',
            number: emptySeat ? -1 : index + 1,
            isReserved: reservedSeatIndex.contains(index));
      },
    );

    super.initState();
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mois,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (selected == index) ? Colors.black : Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            jour,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (selected == index) ? Colors.black : Colors.grey,
              fontSize: 15,
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
            fontSize: 15,
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
              flex: 2,
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
                            crossAxisCount: 10,
                            children: seats.map<Widget>((seat) {
                              return GestureDetector(
                                onTap: () {
                                  if (!seat.isReserved) {
                                    setState(() {
                                      seat.isSelected = !seat.isSelected;
                                    });
                                  }
                                },
                                child: seat.number == -1
                                    ? Container()
                                    : Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: seat.isReserved
                                              ? Colors.lightGreenAccent.withOpacity(.3)
                                              : seat.isSelected
                                                  ? Colors.lightGreenAccent
                                                  : Colors.transparent,
                                          border: Border.all(
                                            color: seat.isReserved
                                                ? Colors.lightGreenAccent
                                                    .withOpacity(.3)
                                                : Colors.lightGreenAccent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  height: 18,
                                  width: 18,
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
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent
                                        .withOpacity(.3),
                                    border: Border.all(
                                      color: Colors.lightGreenAccent
                                          .withOpacity(.3),
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
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
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
                                    fontSize: 13,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                  builder: (context) => const RecapRecuScreen(),
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
