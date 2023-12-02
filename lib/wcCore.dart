/*
The wcCore library defines the core UI elements used in the WareCheap app.

wcColors: This class is used to store the colors used in the app so that they 
can be easily changed.

wcCore: This class stores a skeleton scaffold that is used in most of the app.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';

/// this class is used to store the colors used in the app so that
/// they can be easily changed
class wcColors {
  // text colors
  static const Color primaryText = Color.fromARGB(255, 80, 80, 80);

  // background colors
  static const Color bgPrimary =
      Color.fromARGB(255, 204, 213, 174); // used: scaffold
  static const Color bgPrimaryAccent =
      Color.fromARGB(255, 187, 196, 160); // used:
  static const Color bgSecondary =
      Color.fromARGB(255, 254, 250, 224); // used: navbar, drawer
  static const Color bgTertiary =
      Color.fromARGB(255, 233, 237, 201); // used: body

  // border colors
  static const Color borderPrimary = Color.fromARGB(255, 217, 221, 186);
}

/// this class stores a skeleton scaffold that is used in most of the app
class wcCore {
  // constructor
  wcCore(BuildContext context, String appbarTitle, Widget bodyContext) {
    coreUI(context, appbarTitle, bodyContext);
  }

  // coreUI
  static Scaffold coreUI(
      BuildContext context, String appbarTitle, Widget bodyContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarTitle,
          style: TextStyle(color: wcColors.primaryText),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Color.fromARGB(255, 80, 80, 80), // Text color
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSigninPro>(context, listen: false);
              provider.Logout(context);
            },
          ),
        ],
        backgroundColor: wcColors.bgPrimary,
      ),
      drawer: navBar(context),
      body: bodyContext,
      backgroundColor: wcColors.bgSecondary,
    );
  }
}
