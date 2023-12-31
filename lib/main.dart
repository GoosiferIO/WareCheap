// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:warecheap/pages/profile.dart';
import 'package:warecheap/pages/home.dart';
import 'package:warecheap/pages/page2.dart';
import 'package:warecheap/pages/itemreview.dart';
import 'package:warecheap/pages/storereview.dart';
import 'package:warecheap/pages/browse.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/services/signinprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:warecheap/pages/signin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warecheap/pages/addproduct.dart';
import 'package:warecheap/pages/product.dart';

// decide which page to go to based on if the user is logged in or not
String _initRoute(User? user) {
  if (user != null) {
    return '/first';
  } else {
    return '/Google';
  }
}

void main() async {
  await dotenv.load(fileName: 'serviceKeys.env');
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
          // '/second': (context) => const Page1(),
          '/Google': (context) => SigninPage(), // not needed if signed in
          '/Profile': (context) => LoggedInWidget(), // edit profile page
          '/ItemRev': (context) => reviewItem(),
          '/StoreRev': (context) => reviewStore(),
          '/Author': (context) => const Page2(),
          '/Browse': (context) => const Browse(),
          '/AddProduct': (context) => AddProduct(imgDir: ''),
          '/Product': (context) => ProductPage(),
          //'/CaptureImg': (context) => const wcCamState(),
        },
      ),
    ),
  );
}
