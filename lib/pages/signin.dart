// ignore_for_file: use_key_in_widget_constructors,, prefer_final_fields
// ignore_for_file: library_private_types_in_public_api, unused_field

/*
  This page is the sign in page for the app. It allows the user to sign in with
  their google account. It's the first thing a user sees when they open the app
  and they cannot see anything else until they sign in.
*/

import 'package:flutter/material.dart';
import 'package:warecheap/services/signinprovider.dart';
import 'package:warecheap/widgets/wcCore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success; // start with null so it defaults to no error
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context: context,
      appbarTitle: 'Sign In',
      bodyContext: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 130,
              child: Image.asset(
                'assets/Logo.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    wcColors.bgPrimaryAccent,
                  ),
                ),
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSigninPro>(context, listen: false);
                  bool success = await provider.googleLogin(context);

                  setState(() {
                    _success = success;

                    // if success go to home page
                    if (success) {
                      Navigator.pushNamed(context, '/first');
                    }
                  });
                },
                child: const Text(
                  'Sign In with Google',
                  style: TextStyle(
                    color: wcColors.primaryText, // Change the color to blue
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                _success == null
                    ? ''
                    : (_success == true
                        ? 'Successfully signed in $_userEmail'
                        : 'Sign in failed'),
                style: const TextStyle(
                  color: wcColors.errorText,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ],
        ),
      ),
      enableDrawer: false,
    );
  }
}
