import 'package:flutter/material.dart';

import 'add_car.dart';
import 'auth/login.dart';
import 'auth/register.dart';
import 'customer_info.dart';
import 'my_cars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belia Cars Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 224, 58, 58),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 224, 58, 58),
          foregroundColor: Colors.white,
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
