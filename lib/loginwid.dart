// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors,
// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warecheap/pages/signin.dart';
import 'package:warecheap/widgets/wcCore.dart';

class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return SigninPage();
    }

    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Profile',
      bodyContext: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16), // Added padding for better spacing
        child: Container(
          padding: const EdgeInsets.all(16), // Added padding for better spacing
          color: wcColors.bgTertiaryAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  color: wcColors.primaryText,
                  fontSize: 32, // Increased font size
                ),
              ),
              const SizedBox(height: 32),
              CircleAvatar(
                radius: 75, // Increased avatar size
                backgroundImage: NetworkImage(user.photoURL ?? ''),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  Text(
                    'Name: ',
                    style: const TextStyle(
                        color: wcColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Increased font size
                  ),
                  Text(
                    '${user.displayName ?? 'No Name'}',
                    style: const TextStyle(
                        color: wcColors.primaryText,
                        fontSize: 20), // Increased font size
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 8),
                  Text(
                    'Email: ',
                    style: const TextStyle(
                        color: wcColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Increased font size
                  ),
                  Text(
                    '${user.email ?? 'No Email'}',
                    style: const TextStyle(
                        color: wcColors.primaryText,
                        fontSize: 20), // Increased font size
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
