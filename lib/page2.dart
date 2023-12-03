// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/services/signinprovider.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Authors', style: TextStyle(color: Colors.white)),
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
            )
          ],
          backgroundColor: Colors.lightGreen[900],
        ),
        drawer: navBar(context),
        body: const Center());
  }
}
