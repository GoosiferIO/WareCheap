import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';
import 'package:warecheap/storereview.dart';

class wcCore {

  // constructor
  wcCore(BuildContext context, String appbarTitle, Widget bodyContext) {
    coreUI(context, appbarTitle, bodyContext);
  }

  // coreUI
  static Scaffold coreUI(BuildContext context, String appbarTitle, Widget bodyContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white, // Text color
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
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: navBar(context),
      body: bodyContext,
    );
  }
  
}
