// ignore_for_file: unnecessary_this, prefer_const_constructors

/*
The wcCore library defines the core UI elements used in the WareCheap app.

wcColors: This class is used to store the colors used in the app so that they 
can be easily changed.

wcCore: This class stores a skeleton scaffold that is used in most of the app.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/services/signinprovider.dart';

/// this class is used to store the colors used in the app so that
/// they can be easily changed
class wcColors {
  // text colors
  static const Color primaryText = Color.fromARGB(255, 80, 80, 80);
  static const Color secondaryText = Color.fromARGB(255, 120, 120, 120);
  static const Color linkText = Color.fromARGB(255, 167, 124, 81);
  static const Color errorText = Color.fromARGB(255, 167, 98, 81);

  // background colors
  static const Color bgPrimary =
      Color.fromARGB(255, 204, 213, 174); // used: scaffold
  static const Color bgPrimaryAccent =
      Color.fromARGB(255, 187, 196, 160); // used:
  static const Color bgSecondary =
      Color.fromARGB(255, 254, 250, 224); // used: navbar, drawer
  static const Color bgTertiary =
      Color.fromARGB(255, 233, 237, 201); // used: body
  static const Color bgTertiaryAccent =
      Color.fromARGB(255, 241, 238, 208); // used: browse product bg

  // card bg colors
  static const Color bgCard =
      Color.fromARGB(255, 248, 245, 225); // used: product cards in wcProducts

  // border colors
  static const Color borderPrimary =
      Color.fromARGB(255, 217, 221, 186); // used: navbar dividers
}

/// this class stores a skeleton scaffold that is used in most of the app
class wcCore {
  // properties
  BuildContext context;
  String appbarTitle;
  Widget bodyContext;
  bool? enableDrawer;

  // constructor
  wcCore(this.context, this.appbarTitle, this.bodyContext,
      {this.enableDrawer}) {
    coreUI(this.context, this.appbarTitle, this.bodyContext,
        enableDrawer: this.enableDrawer);
  }

  // coreUI
  static Scaffold coreUI(
      BuildContext context, String appbarTitle, Widget bodyContext,
      {bool? enableDrawer = true}) {
    if (enableDrawer == false) {
      return Scaffold(
        body: bodyContext,
        backgroundColor: wcColors.bgPrimary,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: wcColors.primaryText, // Set the desired color here
          ),
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
                  color: wcColors.linkText, // Text color
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
}
