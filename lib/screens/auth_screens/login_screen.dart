import 'package:car_project/screens/auth_screens/register_screen.dart';
import 'package:car_project/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPass = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Login success'),
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                        width: 250,
                        height: 260,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  20.verticalSpace,
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  15.verticalSpace,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.red),
                      ),
                    ),
                  ),
                  Center(
                    child: FilledButton(
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          login();
                        }
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  FilledButton.icon(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      label: const Text(
                        'Signup with Gmail',
                        style: TextStyle(fontSize: 16),
                      ),
                      icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/google.png'))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: const Text(
                          'Create one now',
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
