import 'package:flutter/material.dart';
import 'package:warecheap/interface/wcProducts.dart';
import 'package:warecheap/interface/wcCore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success = false;
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return wcCore.coreUI(
      context,
      'Sign In',
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async {
                  //_registerWithEmailAndPassword();
                },
                child: const Text('Register'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async {
                  //_signInWithGoogle();
                },
                child: const Text('Sign In with Google'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                _success == null
                    ? ''
                    : (_success
                        ? 'Successfully signed in $_userEmail'
                        : 'Sign in failed'),
                style: const TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
