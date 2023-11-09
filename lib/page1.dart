import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warecheap/navbar.dart';
import 'package:warecheap/signinprovider.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse', style: TextStyle(color: Colors.white)),
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
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
