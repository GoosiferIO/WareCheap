import 'package:flutter/material.dart';
import 'package:warecheap/home.dart';
import 'package:warecheap/loginwid.dart';
import 'package:warecheap/page1.dart';
import 'package:warecheap/page2.dart';
import 'package:warecheap/signup.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:warecheap/signinprovider.dart'; // Import your GoogleSignInProvider
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          '/third': (context) => const Page2(),
          '/Google': (context) => SignupWidget(),
          '/Profile': (context) => LoggedInWidget()
        },
      ),
    ),
  );
}
