import 'package:flutter/material.dart';
import 'package:new_login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'READ ME.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              tileColor: const Color.fromARGB(255, 32, 31, 31),
              title: Text(
                'Topic $index',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Description $index',
                style: const TextStyle(color: Colors.white),
              ),
              leading: index.isEven
                  ? const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/swirl.jpg'),
                    )
                  : Container(
                      child: Image.asset(
                        'assets/images/bird.jpg',
                      ),
                    ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider(
              height: 1,
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(ctx).pop(); // To Cancel dialog
      },
    );

    Widget continueButton = TextButton(
      //To continue & navigate
      child: const Text("Log Out"),
      onPressed: () {
        Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      },
    );

    //AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Sign out?"),
      content: const Text("Log out of READ ME.?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // Show AlertDialog
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return alert;
      },
    );
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear;
  }
}
