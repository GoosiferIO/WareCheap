// ignore_for_file: use_build_context_synchronously
// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSigninPro extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? firebaseUser = authResult.user;

      if (firebaseUser != null) {
        await saveUserProfile(firebaseUser);
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> saveUserProfile(User user) async {
    final DocumentReference userDoc =
        _firestore.collection('users').doc(user.uid);

    await userDoc.set({
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL ?? '', // Save profile picture URL
      // Add more profile information as needed
    });
  }

  Future<void> Logout(BuildContext context) async {
    try {
      if (_auth.currentUser != null) {
        await googleSignIn.disconnect();
        await _auth.signOut();
        Navigator.pushReplacementNamed(context, '/Google');
      } else {
        Navigator.pushReplacementNamed(context, '/Google');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
