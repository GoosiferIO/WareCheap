// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/services/signinprovider.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign-Up/Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
                'assets/Google.png'), // Replace with the correct image path
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Hello! Welcome Back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(
              child: Text(
                'Please sign in with your Google account.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: const Size(double.infinity, 50)),
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                label: const Text('Sign In with Google'),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSigninPro>(context, listen: false);
                  provider.googleLogin(context);
                }),
            const SizedBox(height: 40),
            const SizedBox(
              child: Text(
                'You will have access to all features upon sign-in.',
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
