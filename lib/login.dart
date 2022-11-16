import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_login/main.dart';
import 'package:new_login/screen_one.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final uname = 'reems';
  final pass = '123';
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 22, 22),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Lottie.asset('assets/images/35235-reading.json'),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    //first textfield
                    child: TextFormField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value != uname) {
                          return 'Invalid Username';
                        }
                        return null;
                      },
                    ),
                  ),
                  //second textfield
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value != pass) {
                          return 'Invalid Password';
                        }
                        return null;
                      },
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() == true) {
                        await checkLogin(context);
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext ctx) async {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const ScreenOne(),
      ),
    );
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setBool(sAVEKEYNAME, true);

    if (mounted) {
      showTopSnackBar(
          ctx, const CustomSnackBar.success(message: "Login Successful"),
          displayDuration: const Duration(seconds: 2));
    }
  }
}
