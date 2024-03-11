import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapps/data/car.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

final List<String> carColor = [
  'Black',
  'White',
  'Grey',
  'Red',
  'Blue',
  'Green'
];

class _AddCarState extends State<AddCar> {
  final addFormKey = GlobalKey<FormState>();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final plateLettersController = TextEditingController();
  final plateNumberController = TextEditingController();
  final mileageController = TextEditingController();
  String? selectedColor;

  @override
  void dispose() {
    plateLettersController.dispose();
    plateNumberController.dispose();
    brandController.dispose();
    modelController.dispose();
    mileageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Car'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: addFormKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: brandController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter brand name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Brand name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: modelController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter model name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Car model',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: plateLettersController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter plate number";
                        } else if (!RegExp(
                                r'^([A-Z]{1,3}|[\u0621-\u064A](?: [\u0621-\u064A]){0,2})$')
                            .hasMatch(value)) {
                          return "Not valid";
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.characters,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'ABC',
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    child: Text(
                      '-',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: plateNumberController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter plate number";
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '123',
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: mileageController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter car mileage";
                        } else if (!RegExp(r'^\d{1,4}(?:\.\d{1,2})?$')
                            .hasMatch(value)) {
                          return "Enter a valid value";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: '0.0',
                          suffixText: 'L/100 km',
                          contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: selectedColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select color";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Select color',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      items: carColor
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (addFormKey.currentState!.validate()) {
                    //make a new car object
                    Car newCar = Car(
                        brandController.text,
                        modelController.text,
                        selectedColor!,
                        '${plateLettersController.text} - ${plateNumberController.text}');
                    //then add car to the list
                    ownedCars.add(newCar);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Car Added'),
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
