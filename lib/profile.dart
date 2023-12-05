// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warecheap/loginwid.dart';

class HomePage extends StatelessWidget {
  final User? user; // User object to be passed from parent widget

  const HomePage({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong!'));
              } else {
                // return SignupWidget(); commented out for now
                return Placeholder();
              }
            }),
      );
}
