import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/signup.dart';

class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // Check if the user is not authenticated
    if (user == null) {
      // Redirect to LoginPage if not authenticated
      return SignupWidget();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSigninPro>(context, listen: false);
              provider.Logout(context);
            },
          )
        ],
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL ?? ''),
            ),
            const SizedBox(height: 8),
            Text(
              'Name: ${user.displayName ?? 'No Name'}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Email: ${user.email ?? 'No Email'}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
