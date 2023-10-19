import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/db_service.dart';
import '../services/usermodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                Futbol footBall = Futbol(
                  name: "Cristiano Ronaldo",
                  position: "Striker",
                  height: 1.85,
                  rating: 99,
                  country: "Portugal",
                  thropies: ["UCL", "Europe Cup", "Ballon dor"],
                  isMusilman: false,
                  number: 7,
                );
                databaseServices.add(footBall);
              },
              child: const Text('Player Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Futbol footBall = Futbol(
                  name: 'Neymar',
                  position: "Winger",
                  number: 9,
                  height: 1.77,
                  rating: 90,
                  country: "Brazil",
                  thropies: ["Copa America", "UCL Cup", "La Liga Cup"],
                  isMusilman: false,
                );
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    if (item.name == "Cristiano Ronaldo") {
                      footBall.id = item.id;
                      databaseServices.update(footBall);
                    }
                  }
                });
              },
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    log('${item.rating}');
                  }
                });
              },
              child: const Text("Get"),
            ),
            //delete
            ElevatedButton(
              onPressed: () async {
                DatabaseServices databaseServices = DatabaseServices();
                databaseServices.get().then((value) {
                  for (final item in value) {
                    databaseServices.delete(item.id ?? "");
                  }
                });
              },
              child: const Text("Delete"),
            )
          ],
        ),
      ),
    );
  }
}
