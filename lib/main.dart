// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warecheap/home.dart';
import 'package:warecheap/loginwid.dart';
import 'package:warecheap/page1.dart';
import 'package:warecheap/page2.dart';
import 'package:warecheap/itemreview.dart';
import 'package:warecheap/storereview.dart';
import 'package:warecheap/signup.dart';
import 'package:warecheap/browse.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:warecheap/wcUploadFile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Upload the file to BunnyCDN. This is just a test to make sure that the
  // uploadFile function works.
  int runCount = 1;

  for (int i = 0; i < runCount; i++) {
    uploadFile('', 'Logo.png');
  }

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
        initialRoute: '/first',
        routes: {
          '/first': (context) => const Home(),
          '/second': (context) => const Page1(),
          '/Google': (context) => SignupWidget(),
          '/Profile': (context) => LoggedInWidget(),
          '/ItemRev': (context) => reviewItem(),
          '/StoreRev': (context) => reviewStore(),
          '/Author': (context) => const Page2(),
          '/Browse': (context) => const Browse(),
        },
      ),
    ),
  );
}
