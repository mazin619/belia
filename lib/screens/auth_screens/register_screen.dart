import 'package:car_project/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final List<String> gender = ['Male', 'Female'];
final List<String> options = ['Yes', 'No'];
final List<String> age = [
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
  '36',
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
  '43',
  '44',
  '45',
  '46',
  '47',
  '48',
  '49',
  '50',
];
final List<String> carColor = [
  'Black',
  'White',
  'Grey',
  'Red',
  'Blue',
  'Green'
];

class _RegisterScreenState extends State<RegisterScreen> {
  final registerFromKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final plateLettersController = TextEditingController();
  final plateNumberController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final mileageController = TextEditingController();
  String selectedGender = gender[0];
  String selectedColor = 'Black', selectedAge = '16';
  bool showPass = true,
      showPass2 = true,
      hasCar = false; //showpass = show hide password

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: registerFromKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  15.verticalSpace,
                  //first, last name
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            5.verticalSpace,
                            TextFormField(
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
                                    RegExp(r'[a-zA-Z]')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            5.verticalSpace,
                            TextFormField(
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
                                    RegExp(r'[a-zA-Z]')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  //email
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validateEmail(value),
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                  ),
                  15.verticalSpace,
                  //phone
                  const Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter phone";
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
                  15.verticalSpace,
                  //password
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  TextFormField(
                    obscureText: showPass,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          icon: Icon(
                            showPass
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  15.verticalSpace,
                  //confirm password
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  TextFormField(
                    obscureText: showPass2,
                    controller: confirmPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm password';
                      } else if (passwordController.value !=
                          confirmPasswordController.value) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter same password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass2 = !showPass2;
                            });
                          },
                          icon: Icon(
                            showPass2
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  15.verticalSpace,
                  //gender
                  Row(
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      Radio(
                        value: gender[0],
                        groupValue: selectedGender,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          selectedGender = value!;
                          setState(() {});
                        },
                      ),
                      Text(
                        gender[0],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.horizontalSpace,
                      Radio(
                        value: gender[1],
                        groupValue: selectedGender,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          selectedGender = value.toString();
                          setState(() {});
                        },
                      ),
                      Text(
                        gender[1],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  //age
                  Row(
                    children: [
                      const SizedBox(
                        width: 115,
                        child: Text(
                          'Age',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      15.horizontalSpace,
                      DropdownButton(
                        items: age
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        value: selectedAge,
                        borderRadius: BorderRadius.circular(22),
                        menuMaxHeight: 150,
                        onChanged: (value) {
                          selectedAge = value!;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  //have car
                  Row(
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Own a car?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      Radio(
                        value: true,
                        groupValue: hasCar,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          hasCar = value!;
                          setState(() {});
                        },
                      ),
                      const Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.horizontalSpace,
                      Radio(
                        value: false,
                        groupValue: hasCar,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          hasCar = value!;
                          setState(() {});
                        },
                      ),
                      const Text(
                        'No',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  hasCar
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            15.verticalSpace,
                            //plates
                            const Text(
                              'Plate Number',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            5.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: plateLettersController,
                                    validator: (value) {
                                      if (hasCar &&
                                          (value == null || value.isEmpty)) {
                                        return "Please enter plate number";
                                      }
                                      return null;
                                    },
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      hintText: 'ABC',
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(6),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      hintText: '-',
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    controller: plateNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (hasCar &&
                                          (value == null || value.isEmpty)) {
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
                            15.verticalSpace,
                            //brand,model
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Brand Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      5.verticalSpace,
                                      TextFormField(
                                        controller: brandController,
                                        validator: (value) {
                                          if (hasCar &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return "Please enter brand name";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Toyota',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Model Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      5.verticalSpace,
                                      TextFormField(
                                        controller: modelController,
                                        validator: (value) {
                                          if (hasCar &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return "Please enter model name";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Yaris',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            15.verticalSpace,
                            //mileage, color
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Car Mileage',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      5.verticalSpace,
                                      TextFormField(
                                        controller: mileageController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (hasCar &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return "Please enter car mileage";
                                          } else if (hasCar &&
                                              !RegExp(r'^\d{1,4}(?:\.\d{1,2})?$')
                                                  .hasMatch(value!)) {
                                            return "Enter a valid value";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            hintText: '0.0',
                                            suffixText: 'L/100 km',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15)),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Car Color',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      5.verticalSpace,
                                      DropdownButton(
                                        value: selectedColor,
                                        hint: const Text('Select color'),
                                        borderRadius: BorderRadius.circular(22),
                                        items: carColor
                                            .map((e) => DropdownMenuItem(
                                                value: e, child: Text(e)))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedColor = value!;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(),
                  20.verticalSpace,
                  FilledButton(
                    onPressed: () {
                      if (registerFromKey.currentState!.validate()) {}
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login here',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
