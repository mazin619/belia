import 'package:flutter/material.dart';

import 'data/car.dart';

class MyCars extends StatefulWidget {
  const MyCars({super.key});

  @override
  State<MyCars> createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ownedCars.isEmpty
                  ? const Center(child: Text('No cars owned'))
                  : ListView.builder(
                      itemCount: ownedCars.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.drive_eta,
                                  size: 25,
                                ),
                                title: Text(
                                    '${ownedCars[index].brand},${ownedCars[index].model}'),
                                subtitle: Text(ownedCars[index].color),
                                trailing: Text(ownedCars[index].plates),
                              ),
                              FilledButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Are you sure?'),
                                        content: const Text(
                                          'Are you sure you want to delete this car?',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Yes'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              ownedCars.removeAt(index);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('Delete Car'),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, 'addCar').then((value) {
                  setState(() {});
                });
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Add a new car',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
