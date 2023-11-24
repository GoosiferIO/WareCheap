// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

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

    if (user == null) {
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
        padding: const EdgeInsets.all(20), // Added padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32, // Increased font size
                fontWeight: FontWeight.bold, // Added bold
              ),
            ),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 75, // Increased avatar size
              backgroundImage: NetworkImage(user.photoURL ?? ''),
            ),
            const SizedBox(height: 16),
            Text(
              'Name: ${user.displayName ?? 'No Name'}',
              style: const TextStyle(
                  color: Colors.white, fontSize: 20), // Increased font size
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${user.email ?? 'No Email'}',
              style: const TextStyle(
                  color: Colors.white, fontSize: 20), // Increased font size
            ),
          ],
        ),
      ),
    );
  }
}
