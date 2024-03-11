import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final customerFormKey = GlobalKey<FormState>();
  final fNameController = TextEditingController(text: "Mohamed");
  final lNameController = TextEditingController(text: "Ali");
  final phoneController = TextEditingController(text: "01125564479");
  final addressController =
      TextEditingController(text: "Alexandria, 45 Street");
  final landmarkController = TextEditingController();

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Customer Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: customerFormKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: fNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter first name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter first name',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(
                            r'^[a-zA-Z\u0600-\u06FF]+$',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: lNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter last name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter last name',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z\u0600-\u06FF]+$')),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone";
                  } else if (!RegExp(r'^(010|011|012|015)\d{8}$')
                      .hasMatch(value)) {
                    return "Enter a valid phone";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your phone',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: addressController,
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter address";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: landmarkController,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: 'Landmark (optional)',
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (customerFormKey.currentState!.validate()) {}
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Submit',
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
