import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/storereview.dart';

class wcColors {
  static const Color primaryText = Color.fromARGB(255, 80, 80, 80);
}

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
        backgroundColor: Color.fromARGB(255, 204, 213, 174),
      ),
      drawer: navBar(context),
      body: bodyContext,
      backgroundColor: Color.fromARGB(255, 254, 250, 224),
    );
  }
}
