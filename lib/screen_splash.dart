import 'package:flutter/material.dart';
import 'package:new_login/login.dart';
import 'package:new_login/main.dart';
import 'package:new_login/screen_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 86, 3, 31),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'READ ME.',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
            Image.asset(
              'assets/images/R.png',
              height: 74,
              width: 900,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const LoginScreen()));
    }
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();

    final userLoggedIn = sharedprefs.getBool(sAVEKEYNAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
     if(mounted){
       Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const ScreenOne()));
     }
    }
  }
}
