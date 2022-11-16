import 'package:flutter/material.dart';
import 'package:new_login/screen_splash.dart';

const sAVEKEYNAME = 'UserLoggedIn';

void  main() async{
 
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
      primarySwatch: Colors.grey
      ),
      debugShowCheckedModeBanner: false, 
      home: const ScreenSplash(),
      );
  }
}
