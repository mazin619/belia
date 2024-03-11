import 'package:flutter/material.dart';
import 'package:myapps/screens/add_car.dart';

import 'package:myapps/screens/auth/login.dart';
import 'package:myapps/screens/auth/register.dart';
import 'package:myapps/screens/customer_info.dart';
import 'package:myapps/screens/my_cars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belia Cars Servicessss',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 35, 35, 35),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 13),
          filled: true,
          fillColor: const Color(0xFFF2F2F6),
          contentPadding: const EdgeInsets.only(left: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 73, 73, 73), width: 2),
            borderRadius: BorderRadius.circular(25.0),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
      initialRoute: 'myCars',
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'customerInfo': (context) => const CustomerInfo(),
        'myCars': (context) => const MyCars(),
        'addCar': (context) => const AddCar(),
      },
    );
  }
}
