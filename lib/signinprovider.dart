import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninPro extends ChangeNotifier {
  final googlesignin = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googlesignin.signIn();
    _user = googleUser;

    final googleAuth = await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future<void> Logout(BuildContext context) async {
    // Check if there is a user logged in
    if (FirebaseAuth.instance.currentUser != null) {
      await googlesignin.disconnect();
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/Google');
    }

    // Navigate to the desired page, in this case, '/Google'
    Navigator.pushReplacementNamed(context, '/Google');
  }
}
