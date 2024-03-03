
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapps/screens/auth_screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //To prevent app from landscape orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Belia Car Services',
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
        home: const LoginScreen(),
      ),
    );
  }
}
