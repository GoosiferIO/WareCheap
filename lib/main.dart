// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warecheap/pages/home.dart';
//import 'package:warecheap/loginwid.dart';
import 'package:warecheap/page1.dart';
import 'package:warecheap/page2.dart';
import 'package:warecheap/itemreview.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/signup.dart';
import 'package:warecheap/pages/browse.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/services/signinprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:warecheap/services/wcUploadFile.dart';
import 'package:warecheap/pages/signin.dart';

// decide which page to go to based on if the user is logged in or not
String _initRoute(User? user) {
  if (user != null) {
    return '/first';
  } else {
    return '/Google';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Upload the file to BunnyCDN. This is just a test to make sure that the
  // uploadFile function works.
  // int runCount = 1;

  // for (int i = 0; i < runCount; i++) {
  //   uploadFile('', 'Logo.png');
  // }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          GoogleSigninPro(), // Provide your GoogleSignInProvider here
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Warecheap',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        initialRoute: _initRoute(FirebaseAuth.instance.currentUser),
        routes: {
          '/first': (context) => const Home(),
          '/second': (context) => const Page1(),
          '/Google': (context) => SigninPage(),
          '/Profile': (context) => SigninPage(), // edit profile page
          '/ItemRev': (context) => reviewItem(),
          '/StoreRev': (context) => reviewStore(),
          '/Author': (context) => const Page2(),
          '/Browse': (context) => const Browse(),
        },
      ),
    ),
  );
}
